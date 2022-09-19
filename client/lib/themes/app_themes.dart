import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
    ),
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    fontFamily: AppTextStyles.gilroyRegular,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    // backgroundColor: CustomColors.appGreen,
    // ),
  );
}
