import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final double width;
  final Function()? onPressed;
  final double height;
  final IconData? iconToSet;
  final Gradient? gradient;
  final Color? buttonTextColor;
  final List<BoxShadow>? boxShadow;
  final Color? iconColor;
  final double? iconSize;
  final Widget? widget;
  final Color? buttonColor;
  final bool isLeftAligned;
  final String? fontStyle;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.width,
    required this.height,
    required this.onPressed,
    this.iconToSet,
    this.gradient,
    this.buttonTextColor,
    this.boxShadow,
    this.iconColor,
    this.iconSize,
    this.widget,
    this.buttonColor,
    this.fontStyle,
    this.isLeftAligned = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: isLeftAligned ? Alignment.centerLeft : Alignment.center,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppDimensions.buttonBorderRadius),
          ),
        ),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        backgroundColor: buttonColor != null
            ? MaterialStateProperty.all(buttonColor)
            : MaterialStateProperty.all(AppColors.primary),
        // elevation: MaterialStateProperty.all(3),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.buttonPaddingTop,
          bottom: AppDimensions.buttonPaddingBottom,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconToSet != null)
              Icon(
                iconToSet,
                size: iconSize ?? SizeConfig.safeHorizontal! * 0.05,
                color: iconColor ?? AppColors.white,
              )
            else
              widget != null ? widget! : const SizedBox.shrink(),
            (iconToSet != null || widget != null)
                ? AppDimensions.wSizedBox2
                : const SizedBox.shrink(),
            Text(
              buttonText,
              style: AppTextStyles.h5().copyWith(
                fontFamily: fontStyle ?? AppTextStyles.gilroySemiBold,
                color: buttonTextColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
