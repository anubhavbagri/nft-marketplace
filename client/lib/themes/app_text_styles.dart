// import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const gilroyRegular = "Gilroy";
  static const gilroyMedium = "Gilroy-Medium";
  static const gilroySemiBold = "Gilroy-SemiBold";
  static const gilroyBold = "Gilroy-Bold";
  static const gilroyExtraBold = "Gilroy-ExtraBold";

  static TextStyle h1() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.heading1TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle h2() {
    return TextStyle(
      fontSize: AppDimensions.heading2TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle h3() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.heading3TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle h4() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.heading4TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle h5() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.heading5TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle body1() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.body1TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle body2() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.body2TextSize,
      fontFamily: gilroyRegular,
    );
  }

  static TextStyle small() {
    return TextStyle(
      color: Colors.black,
      fontSize: AppDimensions.smallTextSize,
      fontFamily: gilroyRegular,
    );
  }

  // static TextStyle link() {
//   return TextStyle(
//     fontSize: AppDimensions.body1TextSize,
//     fontFamily: gilroyMedium,
//     color: AppColors.primary,
//     decoration: TextDecoration.underline,
//   );
// }
}
