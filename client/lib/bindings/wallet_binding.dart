import 'package:client/controllers/wallet_controller.dart';
import 'package:get/get.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WalletController>(WalletController());
  }
}
