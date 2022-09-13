import 'package:client/constants/app_assets.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: SvgPicture.asset(
            AppAssets.lightWordmark,
          ),
        ),
      ),
    );
  }
}
