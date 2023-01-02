import 'package:client/constants/app_assets.dart';
import 'package:client/constants/app_strings.dart';
import 'package:client/core/themes/app_colors.dart';
import 'package:client/core/themes/app_dimensions.dart';
import 'package:client/core/themes/app_text_styles.dart';
import 'package:client/core/themes/background.dart';
import 'package:client/core/utils/size_config.dart';
import 'package:client/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDimensions.hSizedBox4,
              Padding(
                padding: EdgeInsets.only(left: AppDimensions.buttonPaddingLeft),
                child: SvgPicture.asset(
                  AppAssets.lightWordmark,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.1),
                child: Text(
                  AppStrings.subtitle,
                  style: AppTextStyles.h1().copyWith(
                    fontFamily: AppTextStyles.gilroyBold,
                    foreground: Paint()..shader = AppColors.purpleGradient,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Align(
                    child: PrimaryButton(
                      iconToSet: Icons.account_balance_wallet,
                      buttonText: AppStrings.create,
                      width: AppDimensions.primaryButtonWidth,
                      height: AppDimensions.primaryButtonHeight,
                      onPressed: () {},
                    ),
                  ),
                  AppDimensions.hSizedBox2,
                  Text(
                    AppStrings.existing,
                    style: AppTextStyles.body2(),
                  ),
                  AppDimensions.hSizedBox1,
                  Align(
                    child: PrimaryButton(
                      widget: SvgPicture.asset(
                        AppAssets.metamaskIcon,
                        height: SizeConfig.safeHorizontal! * 0.04,
                        width: SizeConfig.safeVertical! * 0.02,
                      ),
                      buttonText: AppStrings.connect,
                      width: AppDimensions.primaryButtonWidth,
                      height: AppDimensions.primaryButtonHeight,
                      onPressed: () async {},
                    ),
                  )
                ],
              ),
              AppDimensions.hSizedBox3,
            ],
          ),
        ),
      ),
    );
    // : const ErrorPage(
    //     errorString: AppStrings.checkInternet,
    //   ),
    // );
  }
}
