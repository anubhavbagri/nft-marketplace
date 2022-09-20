import 'dart:math';

import 'package:client/config/functions.dart';
import 'package:client/controllers/wallet_controller.dart';
import 'package:client/controllers/welcome_controller.dart';
import 'package:client/models/listing_info.dart';
import 'package:client/models/nft_metadata.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/utils/global_utils.dart';
import 'package:client/utils/services/contract_service.dart';
import 'package:client/utils/services/image_picker_service.dart';
import 'package:client/utils/services/ipfs_service.dart';
import 'package:client/views/others/loading_page.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:client/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web3dart/web3dart.dart';

enum CollectionStatus { empty, loading, loaded, success, error }

class NFTController extends GetxController {
  static NFTController get to => Get.find();
  final IPFSService _ipfs = IPFSService();
  final ContractService _contractService = ContractService();
  NFTMetadata nftToMint = NFTMetadata.initEmpty();

  final _pickedImagePath = ''.obs;

  get pickedImagePath => _pickedImagePath.value;

  set pickedImagePath(value) => _pickedImagePath.value = value;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController collectionNameController =
      TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  final TextEditingController royaltiesController = TextEditingController();

  final properties = <Map<String, dynamic>>[].obs;

  final _lastCollectionName = ''.obs;

  get lastCollectionName => _lastCollectionName.value;

  set lastCollectionName(value) => _lastCollectionName.value = value;

  final _isFixed = false.obs;

  get isFixed => _isFixed.value;

  set isFixed(value) => _isFixed.value = value;

  final _forSale = true.obs;

  get forSale => _forSale.value;

  set forSale(value) => _forSale.value = value;

  CollectionStatus state = CollectionStatus.empty;
  String errMessage = '';

  String? imageCID;
  String? metadataCID;

  List<int> uploadImageQue = [];
  List<int> uploadMetadataQue = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  addProperty() {
    showCustomBottomSheet(
      height: AppDimensions.heading1TextSize * 5,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.paddingAllSides),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextBox(placeholder: 'Type', controller: typeController),
            TextBox(placeholder: 'Value', controller: valueController),
            PrimaryButton(
              buttonText: 'Add Property',
              width: double.infinity,
              height: AppDimensions.primaryButtonHeight,
              onPressed: () {
                properties.add({
                  'type': typeController.text,
                  'value': valueController.text
                });
                FocusManager.instance.primaryFocus?.unfocus();
                typeController.clear();
                valueController.clear();
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  pickImage() async {
    final image = await ImagePickerService.pickImage();

    if (image != null) {
      pickedImagePath = image.path;
      uploadImage(pickedImagePath);
      Get.toNamed('/create-nft');
    }
  }

  bool isImagePicked() {
    if (pickedImagePath == null) {
      Get.snackbar('Error', 'Please select a image');
      return false;
    }
    return true;
  }

  uploadImage(String imgPath) async {
    try {
      uploadImageQue.add(1);
      imageCID = null;
      imageCID = await _ipfs.uploadImage(imgPath);
      uploadImageQue.removeLast();
    } catch (e) {
      debugPrint('Error at CollectionController -> uploadImage: $e');
      uploadImageQue.removeLast();
      _handleError(e);
    }
  }

  createNFT() {
    if (isImagePicked()) {
      final nftMetadata = NFTMetadata(
        name: nameController.text,
        description: descriptionController.text,
        image: pickedImagePath!,
        properties: properties,
      );

      uploadMetadata(nftMetadata);
      Get.toNamed('/create-listing', arguments: nftMetadata);
    }
  }

  //Upload metadata to ipfs and store cid
  uploadMetadata(NFTMetadata metaDataWithoutImage,
      {bool isRecursive = false}) async {
    try {
      if (!isRecursive) {
        nftToMint = metaDataWithoutImage;
        uploadMetadataQue.add(1);
      }
      metadataCID = null;
      if (uploadImageQue.isNotEmpty) {
        await Future.delayed(const Duration(milliseconds: 700));
        uploadMetadata(metaDataWithoutImage, isRecursive: true);
        return;
      }
      nftToMint = metaDataWithoutImage.copyWith(image: imageCID);
      metadataCID = await _ipfs.uploadMetaData(nftToMint.toMap());
      uploadMetadataQue.removeLast();

      _handleSuccess();
    } catch (e) {
      debugPrint('Error at CollectionController -> uploadMetadata: $e');
      uploadMetadataQue.removeLast();
      _handleError(e);
    }
  }

  mintNFT(nftMetadata) async {
    // print("Mint NFT btn clicked");
    final listing = ListingInfo(
      listingType: ListingType.fixedPriceSale,
      price: double.parse(priceController.text),
      royalties: int.parse(royaltiesController.text),
    );

    final transaction = await buildTransaction(listing);

    print("#### ${transaction.value}");

    WalletController.to.getTransactionFee(transaction);

    // Get.toNamed('/confirmation', arguments: nftMetadata);

    Get.to(
      () => const LoadingPage(subtext: 'Minting your NFT ✨'),
      transition: Transition.circularReveal,
      duration: const Duration(milliseconds: 500),
    );

    // Navigation.push(
    //   context,
    //   screen: ConfirmationScreen(
    //       action: 'Miniting NFT',
    //       image: widget.nftMetadata.image,
    //       title: widget.nftMetadata.name,
    //       subtitle: widget.collection.name,
    //       onConfirmation: () {
    //         provider.mintNFT(listing, widget.collection);
    //         Navigation.popTillNamedAndPush(
    //           context,
    //           popTill: 'tabs_screen',
    //           screen: const NetworkConfirmationScreen(),
    //         );
    //       }),
    // );
  }

  Future<Transaction> buildTransaction(
    ListingInfo info,
  ) async {
    // already deployed collection cAddress
    final contract = await _contractService
        .loadCollectionContract('0xDb847D8d9aa3dFaaD0BDdc3B8672eaEBba0cdF67');

    print("-> -> ${contract.address}");
    print("-> -> ${contract.abi}");

    final price = info.price * pow(10, 18);

    final transaction = Transaction.callContract(
      from: EthereumAddress.fromHex(
          WelcomeController.to.connector.session.accounts[0]),
      contract: contract,
      function: contract.function(fmintNFT),
      parameters: [
        nftToMint.name,
        imageCID ??
            'bafybeielrpyysfeos56qr2paenj5zmdamvry3rkyyzld4zua7xnpgeg3py',
        nftToMint.properties.toString(),
        metadataCID ??
            'bafybeicklz6kbzwhiqeedmlr42kjr6g5qjb5o5rq3fne4arhsvynzuywk4',
        info.forSale,
        info.isFixedPrice,
        BigInt.from(price),
        BigInt.from(info.royalties),
        '',
      ],
    );

    return transaction;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _handleSuccess() {
    state = CollectionStatus.success;
    errMessage = '';
  }

  void _handleError(e) {
    state = CollectionStatus.error;
    errMessage = e.toString();
  }
}
