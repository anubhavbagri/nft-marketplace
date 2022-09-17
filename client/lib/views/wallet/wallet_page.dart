import 'package:client/constants/app_assets.dart';
import 'package:client/constants/app_strings.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimensions.hSizedBox1,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.lightWordmark,
                    width: AppDimensions.heading1TextSize * 3,
                  ),
                  Text(
                    AppStrings.subtitle,
                    style: AppTextStyles.h4().copyWith(
                      fontFamily: AppTextStyles.gilroyBold,
                      foreground: Paint()..shader = AppColors.purpleGradient,
                    ),
                  ),
                ],
              ),
              AppDimensions.hSizedBox2,
              Lottie.asset(
                "assets/tick_transparent.json",
                key: const Key("tick"),
                width: AppDimensions.heading1TextSize * 4,
              ),
              Text(
                'Congratulations!,\n Your account has been created',
                textAlign: TextAlign.center,
                style: AppTextStyles.h5().copyWith(
                  fontFamily: AppTextStyles.gilroyBold,
                ),
              ),
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: GlassmorphicContainer(
                      width: SizeConfig.safeHorizontal! * 0.9,
                      height: SizeConfig.safeVertical! * 0.35,
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
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.transparent,
                      width: SizeConfig.safeHorizontal! * 0.86,
                      height: SizeConfig.safeVertical! * 0.32,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.info,
                                color: AppColors.primary,
                              ),
                            ),
                            AppDimensions.hSizedBox1,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Private Key:',
                                  style: AppTextStyles.h5().copyWith(
                                    fontFamily: AppTextStyles.gilroyBold,
                                    color: AppColors.secondary,
                                  ),
                                ),
                                Text(
                                  '#############',
                                  style: AppTextStyles.h5().copyWith(
                                    fontFamily: AppTextStyles.gilroyBold,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      SizeConfig.safeHorizontal! * 0.1,
                                      SizeConfig.safeVertical! * 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: AppColors.tertiary,
                                ),
                                child: Text(
                                  'Copy',
                                  style: AppTextStyles.small().copyWith(
                                    fontFamily: AppTextStyles.gilroyBold,
                                    color: AppColors.secondary,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            // AppDimensions.hSizedBox1,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Wallet Balance :',
                                  style: AppTextStyles.h5().copyWith(
                                    fontFamily: AppTextStyles.gilroyBold,
                                    color: AppColors.secondary,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    '0.000235 MATIC',
                                    style: AppTextStyles.small().copyWith(
                                      fontFamily: AppTextStyles.gilroyBold,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            AppDimensions.hSizedBox2,
                            PrimaryButton(
                              onPressed: () {
                                Get.offNamed('/main-screen');
                              },
                              buttonText: 'Get Some MATIC',
                              width: AppDimensions.primaryButtonWidth,
                              height: AppDimensions.primaryButtonHeight,
                              iconToSet: Icons.arrow_forward,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
