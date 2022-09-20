import 'package:client/themes/app_dimensions.dart';
import 'package:client/utils/global_utils.dart';
import 'package:client/utils/services/image_picker_service.dart';
import 'package:client/utils/services/ipfs_service.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:client/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CollectionStatus { empty, loading, loaded, success, error }

class CollectionController extends GetxController {
  static CollectionController get to => Get.find();
  final IPFSService _ipfs = IPFSService();

  final _pickedImagePath = ''.obs;

  get pickedImagePath => _pickedImagePath.value;

  set pickedImagePath(value) => _pickedImagePath.value = value;

  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController collection = TextEditingController();
  final TextEditingController type = TextEditingController();
  final TextEditingController value = TextEditingController();

  final properties = <Map<String, dynamic>>[].obs;

  final _lastCollectionName = ''.obs;

  get lastCollectionName => _lastCollectionName.value;

  set lastCollectionName(value) => _lastCollectionName.value = value;

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
            TextBox(placeholder: 'Type', controller: type),
            TextBox(placeholder: 'Value', controller: value),
            PrimaryButton(
              buttonText: 'Add Property',
              width: double.infinity,
              height: AppDimensions.primaryButtonHeight,
              onPressed: () {
                properties.add({'type': type.text, 'value': value.text});
                FocusManager.instance.primaryFocus?.unfocus();
                type.clear();
                value.clear();
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

  @override
  void onClose() {
    super.onClose();
  }

  void _handleError(e) {
    state = CollectionStatus.error;
    errMessage = e.toString();
  }
}
