import 'package:client/constants/app_assets.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
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
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.lightWordmark,
                ),
                // AppDimensions.hSizedBox2,
                PrimaryButton(
                  iconToSet: Icons.account_balance_wallet,
                  buttonText: 'Create new wallet',
                  width: SizeConfig.safeHorizontal! * 0.8,
                  height: SizeConfig.safeVertical! * 0.02,
                  onPressed: () {},
                ),
                AppDimensions.hSizedBox2,
                PrimaryButton(
                  widget: SvgPicture.asset(
                    AppAssets.metamaskIcon,
                    height: SizeConfig.safeHorizontal! * 0.04,
                    width: SizeConfig.safeVertical! * 0.02,
                  ),
                  buttonText: 'Connect to wallet',
                  width: SizeConfig.safeHorizontal! * 0.8,
                  height: SizeConfig.safeVertical! * 0.02,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
