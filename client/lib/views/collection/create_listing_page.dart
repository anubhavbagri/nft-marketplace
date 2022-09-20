import 'dart:io';

import 'package:client/controllers/nft_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:client/widgets/text_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_switch/sliding_switch.dart';

class CreateNFTListingPage extends GetView<NFTController> {
  const CreateNFTListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nftMetadata = Get.arguments;
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: AppColors.primary),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: AppDimensions.paddingAllSides * 2,
              right: AppDimensions.paddingAllSides * 2,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDimensions.hSizedBox2,
                  PrimaryButton(
                    buttonText:
                        '${nftMetadata.name.toString().toUpperCase()} ✨',
                    buttonTextColor: AppColors.primary,
                    isLeftAligned: true,
                    widget: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppDimensions.buttonBorderRadius),
                      child: Image.file(
                        File(nftMetadata.image),
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    buttonColor: AppColors.black.withOpacity(0.5),
                    width: double.infinity,
                    height: AppDimensions.primaryButtonHeight,
                    onPressed: null,
                  ),
                  AppDimensions.hSizedBox3,
                  Obx(
                    () => Center(
                      child: SlidingSwitch(
                        value: controller.isFixed,
                        width: SizeConfig.safeHorizontal! * 0.85,
                        onChanged: (bool value) {
                          controller.isFixed = value;
                        },
                        height: SizeConfig.safeVertical! * 0.06,
                        animationDuration: const Duration(milliseconds: 100),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOff: "Fixed Price",
                        textOn: "Set for Bid",
                        colorOn: Colors.white,
                        colorOff: Colors.white,
                        background: AppColors.black.withOpacity(0.5),
                        buttonColor: AppColors.primary,
                        inactiveColor: AppColors.primary,
                      ),
                    ),
                  ),
                  AppDimensions.hSizedBox2,
                  Obx(
                    () => Center(
                      child: SlidingSwitch(
                        value: controller.forSale,
                        width: SizeConfig.safeHorizontal! * 0.85,
                        onChanged: (bool value) {
                          controller.forSale = value;
                        },
                        height: SizeConfig.safeVertical! * 0.06,
                        animationDuration: const Duration(milliseconds: 100),
                        onTap: () {},
                        onDoubleTap: () {},
                        onSwipe: () {},
                        textOn: "For Sale",
                        textOff: "Private",
                        colorOn: Colors.white,
                        colorOff: Colors.white,
                        background: AppColors.black.withOpacity(0.5),
                        buttonColor: AppColors.primary,
                        inactiveColor: AppColors.primary,
                      ),
                    ),
                  ),
                  AppDimensions.hSizedBox3,
                  TextBox(
                      placeholder: 'Royalties in %',
                      controller: controller.royaltiesController),
                  AppDimensions.hSizedBox2,
                  TextBox(
                      placeholder: 'Set Price',
                      controller: controller.priceController),
                  // AppDimensions.hSizedBox2,
                  // TextBox(
                  //     placeholder: 'Price in MATIC',
                  //     controller: TextEditingController()),
                  AppDimensions.hSizedBox3,
                  PrimaryButton(
                      buttonText: 'Mint NFT',
                      width: double.infinity,
                      height: AppDimensions.primaryButtonHeight,
                      onPressed: () {
                        controller.mintNFT(nftMetadata);
                      }),
                  AppDimensions.hSizedBox3,
                  Center(
                    child: Text(
                      '* Platform doesn\'t take any\npercentage from royalties 🥺',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body1().copyWith(
                        color: AppColors.secondary.withOpacity(0.8),
                      ),
                    ),
                  ),
                  // AppDimensions.hSizedBox2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
