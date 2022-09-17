import 'package:client/controllers/main_screen_controller.dart';
import 'package:get/get.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainScreenController>(MainScreenController());
  }
}
