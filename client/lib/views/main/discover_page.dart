import 'package:client/controllers/welcome_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.transparent.withOpacity(0.1),
                  // expandedHeight: AppDimensions.heading1TextSize * 0,
                  toolbarHeight: SizeConfig.safeVertical! * 0.12,
                  floating: true,
                  snap: true,
                  // pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 60, 20, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hi, User",
                            style: AppTextStyles.h3().copyWith(
                              fontFamily: AppTextStyles.gilroyBold,
                              foreground: Paint()
                                ..shader = AppColors.purpleGradient,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: SizeConfig.safeVertical! * 0.05,
                              width: SizeConfig.safeVertical! * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "0.235 MAT",
                                  style: AppTextStyles.h5().copyWith(
                                    fontFamily: AppTextStyles.gilroyBold,
                                    foreground: Paint()
                                      ..shader = AppColors.purpleGradient,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                Container(
                  height: SizeConfig.safeVertical! * 0.4,
                  width: SizeConfig.safeHorizontal! * 1,
                  // color: Colors.black,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Obx(
                          () => Text(
                            "${WelcomeController.to.account}\n${WelcomeController.to.balance}",
                            // textAlign: TextAlign.start,
                            style: AppTextStyles.h4().copyWith(
                              fontFamily: AppTextStyles.gilroyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
