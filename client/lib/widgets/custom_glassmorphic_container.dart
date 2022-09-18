import 'package:client/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class CustomGlassmorphicContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? widget;

  const CustomGlassmorphicContainer({
    Key? key,
    required this.width,
    required this.height,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GlassmorphicContainer(
        width: width,
        height: height,
        borderRadius: 0,
        blur: 7,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withOpacity(0.1),
              AppColors.primary.withOpacity(0.1),
            ],
            stops: const [
              0.3,
              1,
            ]),
        borderGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            AppColors.primary,
            AppColors.white,
            AppColors.black,
          ],
          stops: const [0.06, 0.95, 1],
        ),
        child: widget ?? const SizedBox.shrink(),
      ),
    );
  }
}
