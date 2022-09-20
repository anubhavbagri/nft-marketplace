import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';

class PropertiesChip extends StatelessWidget {
  const PropertiesChip({
    Key? key,
    required this.label,
    required this.value,
    required this.percent,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final String value;
  final String percent;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: SizeConfig.safeHorizontal! * .03,
          right: SizeConfig.safeHorizontal! * .02,
          top: SizeConfig.safeVertical! * 0.01,
          bottom: SizeConfig.safeVertical! * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$label : $value',
            style: AppTextStyles.body2().copyWith(
              color: AppColors.primary,
            ),
          ),
          AppDimensions.wSizedBox2,
          if (onPressed != null)
            GestureDetector(
              onTap: onPressed!,
              child: Icon(
                Icons.close,
                color: AppColors.white.withOpacity(0.4),
                size: 17,
              ),
            ),
        ],
      ),
    );
  }
}
