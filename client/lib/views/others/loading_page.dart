import 'package:client/constants/app_assets.dart';
import 'package:client/constants/app_strings.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key, required this.subtext}) : super(key: key);

  final String subtext;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black38, AppColors.primary],
                ),
              ),
              child: Lottie.asset(
                AppAssets.lottieLoading,
                key: const Key("rocket"),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.lightWordmark,
                      width: AppDimensions.heading1TextSize * 3,
                    ),
                    AppDimensions.wSizedBox2,
                    Text(
                      AppStrings.subtitle,
                      style: AppTextStyles.h4().copyWith(
                        fontFamily: AppTextStyles.gilroyBold,
                        foreground: Paint()..shader = AppColors.purpleGradient,
                      ),
                    ),
                  ],
                ),
                Text(
                  subtext,
                  style: AppTextStyles.h4().copyWith(
                    fontFamily: AppTextStyles.gilroyBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
