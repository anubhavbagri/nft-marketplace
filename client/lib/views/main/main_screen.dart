import 'package:client/controllers/main_screen_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/views/main/discover_page.dart';
import 'package:client/views/main/favorite_page.dart';
import 'package:client/views/main/profile_page.dart';
import 'package:client/views/main/search_page.dart';
import 'package:client/widgets/bottom_bar.dart';
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
      () => Scaffold(
        extendBody: true,
        body: pages[controller.tabIndex],
        bottomNavigationBar: BottomBar(
          index: controller.tabIndex,
          onChangedTab: controller.changeTabIndex,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.black,
          shape: const StadiumBorder(
              side: BorderSide(color: Colors.white, width: 1)),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            // size: 40,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
