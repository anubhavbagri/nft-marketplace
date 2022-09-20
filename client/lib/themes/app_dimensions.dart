import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';

class AppDimensions {
  AppDimensions._();

  static final double heading1TextSize = SizeConfig.safeVertical! * .07;
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

  static final double paddingAllSides = SizeConfig.safeHorizontal! * .04;

  static const double buttonBorderRadius = 10;

  static final double primaryButtonWidth = SizeConfig.safeHorizontal! * 0.8;
  static final double primaryButtonHeight = SizeConfig.safeVertical! * 0.02;

  // to give horizontal spacing between elements (for rows)
  static final SizedBox wSizedBox2 = SizedBox(
    width: SizeConfig.safeHorizontal! * 0.02,
  );

  // to give vertical spacing between elements (for columns)
  static final SizedBox hSizedBox1 = SizedBox(
    height: SizeConfig.safeVertical! * 0.008,
  );

  static final SizedBox hSizedBox2 = SizedBox(
    height: SizeConfig.safeVertical! * 0.02,
  );

  static final SizedBox hSizedBox3 = SizedBox(
    height: SizeConfig.safeVertical! * 0.08,
  );

  static final SizedBox hSizedBox4 = SizedBox(
    height: SizeConfig.safeVertical! * 0.14,
  );
}
