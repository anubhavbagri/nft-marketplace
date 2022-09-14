import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  static final double heading1TextSize = SizeConfig.safeVertical! * .045;
  static final double heading2TextSize = SizeConfig.safeVertical! * .0375;
  static final double heading3TextSize = SizeConfig.safeVertical! * .03;
  static final double heading4TextSize = SizeConfig.safeVertical! * .025;
  static final double heading5TextSize = SizeConfig.safeVertical! * .0225;

  static final double body1TextSize = SizeConfig.safeVertical! * .02;
  static final double body2TextSize = SizeConfig.safeVertical! * .0175;
  static final double smallTextSize = SizeConfig.safeVertical! * .015;

  static final double buttonPaddingTop = SizeConfig.safeVertical! * 0.02;
  static final double buttonPaddingBottom = SizeConfig.safeVertical! * 0.02;
  static final double buttonPaddingLeft = SizeConfig.safeHorizontal! * .08;
  static final double buttonPaddingRight = SizeConfig.safeHorizontal! * .08;
}

final SizedBox wSizedBox2 = SizedBox(
  width: SizeConfig.safeHorizontal! * 0.02,
);
