import 'dart:io';

import 'package:client/controllers/collection_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:client/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNFTPage extends GetView<CollectionController> {
  const CreateNFTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: AppColors.primary),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimensions.paddingAllSides),
            child: Column(
              children: [
                AppDimensions.hSizedBox2,
                Center(
                  child: Container(
                    width: AppDimensions.primaryButtonWidth * 0.9,
                    height: AppDimensions.primaryButtonWidth * 0.9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.buttonBorderRadius,
                      ),
                      image: DecorationImage(
                        image: FileImage(File(controller.pickedImagePath!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.05,
                ),
                TextBox(placeholder: 'Name', controller: controller.name),
                AppDimensions.hSizedBox2,
                TextBox(
                    placeholder: 'Description',
                    controller: controller.description),
                AppDimensions.hSizedBox2,
                PrimaryButton(
                  buttonText: 'Properties',
                  buttonColor: Colors.black.withOpacity(0.5),
                  buttonTextColor: AppColors.primary,
                  width: double.infinity,
                  height: AppDimensions.primaryButtonHeight,
                  isLeftAligned: true,
                  fontStyle: AppTextStyles.gilroyMedium,
                  onPressed: () {},
                ),
                AppDimensions.hSizedBox2,
                TextBox(
                    placeholder: 'Collection: ${controller.lastCollectionName}',
                    controller: controller.collection),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.04,
                ),
                PrimaryButton(
                  buttonText: 'Next',
                  width: double.infinity,
                  height: AppDimensions.primaryButtonHeight,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
