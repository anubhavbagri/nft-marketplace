import 'package:animate_icons/animate_icons.dart';
import 'package:camera/camera.dart';
import 'package:client/controllers/main_screen_controller.dart';
import 'package:client/controllers/nft_controller.dart';
import 'package:client/controllers/wallet_controller.dart';
import 'package:client/controllers/welcome_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/views/main/discover_page.dart';
import 'package:client/views/main/favorite_page.dart';
import 'package:client/views/main/profile_page.dart';
import 'package:client/views/main/search_page.dart';
import 'package:client/views/welcome/welcome_page.dart';
import 'package:client/widgets/bottom_bar.dart';
import 'package:client/widgets/custom_glassmorphic_container.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  MainScreen({Key? key}) : super(key: key);

  final pages = <Widget>[
    DiscoverPage(),
    SearchPage(),
    FavouritePage(),
    ProfilePage(),
    // ProfilePage(user: Get.arguments),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () => (WelcomeController.to.account != '' ||
              WalletController.to.publicAdr != '')
          ? Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  pages[controller.tabIndex],
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Visibility(
                        visible: controller.openModal,
                        child: CustomGlassmorphicContainer(
                          height: SizeConfig.safeVertical! * 0.3,
                          width: SizeConfig.safeHorizontal! * 0.9,
                          widget: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                PrimaryButton(
                                    buttonText: "Select from files",
                                    width: SizeConfig.safeHorizontal! * 0.8,
                                    height: SizeConfig.safeVertical! * 0.06,
                                    buttonColor: AppColors.black,
                                    onPressed: () async {
                                      NFTController.to.pickImage();
                                    }),
                                PrimaryButton(
                                  buttonText: "Capture Now",
                                  width: SizeConfig.safeHorizontal! * 0.8,
                                  height: SizeConfig.safeVertical! * 0.06,
                                  onPressed: () async {
                                    await availableCameras().then((cameras) {
                                      Get.toNamed("/camera-screen");
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: BottomBar(
                index: controller.tabIndex,
                onChangedTab: controller.changeTabIndex,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.black,
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 1),
                ),
                onPressed: () {},
                child: AnimateIcons(
                  startIcon: Icons.add,
                  endIcon: Icons.close,
                  controller: AnimateIconController(),
                  startTooltip: 'Icons.add_circle',
                  endTooltip: 'Icons.add_circle_outline',
                  onStartIconPress: () {
                    controller.openModal = !controller.openModal;
                    return true;
                  },
                  onEndIconPress: () {
                    controller.openModal = !controller.openModal;
                    return true;
                  },
                  duration: const Duration(milliseconds: 500),
                  startIconColor: AppColors.white,
                  endIconColor: AppColors.white,
                  clockwise: false,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            )
          : const WelcomePage(),
    );
  }
}
