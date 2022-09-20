import 'package:client/controllers/nft_controller.dart';
import 'package:get/get.dart';

class NFTBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NFTController>(NFTController());
  }
}
