import 'package:client/constants/app_assets.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.lightWordmark,
            ),
            // const Spacer(),
            Align(
              alignment: Alignment.center,
              child: PrimaryButton(
                buttonText: 'Create new wallet',
                width: SizeConfig.safeHorizontal! * 0.8,
                height: SizeConfig.safeVertical! * 0.02,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
