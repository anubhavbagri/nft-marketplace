import 'package:client/constants/app_assets.dart';
import 'package:client/constants/app_strings.dart';
import 'package:client/controllers/wallet_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/global_utils.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/views/others/error_page.dart';
import 'package:client/views/others/loading_page.dart';
import 'package:client/widgets/custom_glassmorphic_container.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return controller.obx(
      (state) {
        return PrimaryBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimensions.hSizedBox2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.lightWordmark,
                        width: AppDimensions.heading1TextSize * 3,
                      ),
                      AppDimensions.wSizedBox2,
                      Text(
                        AppStrings.subtitle,
                        style: AppTextStyles.h4().copyWith(
                          fontFamily: AppTextStyles.gilroyBold,
                          foreground: Paint()
                            ..shader = AppColors.purpleGradient,
                        ),
                      ),
                    ],
                  ),
                  AppDimensions.hSizedBox2,
                  Lottie.asset(
                    AppAssets.lottieTick,
                    key: const Key("tick"),
                    width: AppDimensions.heading1TextSize * 4,
                  ),
                  Text(
                    AppStrings.congo,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h5().copyWith(
                      fontFamily: AppTextStyles.gilroyBold,
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomGlassmorphicContainer(
                        width: SizeConfig.safeHorizontal! * 0.9,
                        height: SizeConfig.safeVertical! * 0.33,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color:
                              AppColors.black, //todo: can put some other color
                          width: SizeConfig.safeHorizontal! * 0.84,
                          height: SizeConfig.safeVertical! * 0.30,
                          child: Padding(
                            padding:
                                EdgeInsets.all(AppDimensions.paddingAllSides),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AppDimensions.hSizedBox2,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.publicAdd,
                                      style: AppTextStyles.h5().copyWith(
                                        fontFamily: AppTextStyles.gilroyBold,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    InkWell(
                                      child: Text(
                                        formatAddress(controller.publicAdr),
                                        style: AppTextStyles.h5().copyWith(
                                          fontFamily: AppTextStyles.gilroyBold,
                                          color: AppColors.secondary,
                                        ),
                                      ),
                                      onTap: () {
                                        copyToClipboard(controller.publicAdr);
                                      },
                                    ),
                                  ],
                                ),
                                // AppDimensions.hSizedBox1,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.walletBal,
                                      style: AppTextStyles.h5().copyWith(
                                        fontFamily: AppTextStyles.gilroyBold,
                                        color: AppColors.secondary,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppDimensions
                                                    .buttonBorderRadius),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.primary),
                                      ),
                                      onPressed: null,
                                      child: Text(
                                        '${controller.balance} MATIC',
                                        style: AppTextStyles.small().copyWith(
                                          fontFamily: AppTextStyles.gilroyBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AppDimensions.hSizedBox1,
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: PrimaryButton(
                                    onPressed: () async {
                                      openUrl(controller.faucetUrl);
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      Get.offAllNamed("/main-screen");
                                    },
                                    buttonText: 'Get Some MATIC',
                                    width: AppDimensions.primaryButtonWidth,
                                    height: AppDimensions.primaryButtonHeight,
                                    iconToSet: Icons.arrow_back_rounded,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: AppDimensions.smallTextSize,
                        right: AppDimensions.smallTextSize,
                        child: IconButton(
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.primary,
                          ),
                          splashRadius: 0.1,
                          onPressed: () {
                            showCustomBottomSheet(
                              height: AppDimensions.heading1TextSize * 2.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        AppDimensions.paddingAllSides),
                                    child: Text(
                                      AppStrings.publicAdrInfo,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.body1().copyWith(
                                        fontFamily: AppTextStyles.gilroyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              isDismissible: true,
                            );
                          },
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
      },
      onLoading: const LoadingPage(
        subtext: 'LFG 😤',
      ),
      onError: (err) => ErrorPage(errorString: err.toString()),
    );
  }
}
