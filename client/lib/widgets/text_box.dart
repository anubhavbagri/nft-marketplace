import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  const TextBox({
    Key? key,
    required this.placeholder,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      maxLength: 100,
      controller: controller,
      style: AppTextStyles.body1().copyWith(
        fontFamily: AppTextStyles.gilroyMedium,
        color: AppColors.primary,
      ),
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Colors.black.withOpacity(0.5),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.safeVertical! * .02,
            horizontal: SizeConfig.safeHorizontal! * .04),
        hintText: placeholder,
        hintStyle: AppTextStyles.body1().copyWith(
          fontFamily: AppTextStyles.gilroyMedium,
          color: AppColors.primary,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
      ),
    );
  }
}
