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

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.errorString}) : super(key: key);

  final String errorString;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppDimensions.hSizedBox2,
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
            AppDimensions.hSizedBox3,
            Lottie.asset(
              AppAssets.lottieError,
              key: const Key("cross"),
              width: AppDimensions.heading1TextSize * 4,
            ),
            AppDimensions.hSizedBox3,
            Text(
              AppStrings.error(errorString),
              textAlign: TextAlign.center,
              style: AppTextStyles.h5().copyWith(
                fontFamily: AppTextStyles.gilroyBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
