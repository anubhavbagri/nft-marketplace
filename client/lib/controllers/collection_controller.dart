import 'package:client/utils/services/image_picker_service.dart';
import 'package:client/utils/services/ipfs_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CollectionStatus { empty, loading, loaded, success, error }

class CollectionController extends GetxController {
  static CollectionController get to => Get.find();
  final IPFSService _ipfs = IPFSService();

  final _pickedImagePath = ''.obs;
  get pickedImagePath => _pickedImagePath.value;
  set pickedImagePath(value) => _pickedImagePath.value = value;

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

  pickImage() async {
    final image = await ImagePickerService.pickImage();

    if (image != null) {
      pickedImagePath = image.path;
      uploadImage(pickedImagePath);
      Get.toNamed('create-collection');
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
