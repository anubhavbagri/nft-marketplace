import 'package:client/controllers/collection_controller.dart';
import 'package:get/get.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CollectionController>(CollectionController());
  }
}
