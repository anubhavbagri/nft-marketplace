import 'dart:io';

import 'package:client/controllers/nft_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:client/widgets/properties_chip.dart';
import 'package:client/widgets/text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNFTPage extends GetView<NFTController> {
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
            padding: EdgeInsets.only(
              left: AppDimensions.paddingAllSides,
              right: AppDimensions.paddingAllSides,
              bottom: AppDimensions.heading1TextSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                TextBox(
                    placeholder: 'Name of your NFT',
                    controller: controller.nameController),
                AppDimensions.hSizedBox2,
                TextBox(
                    placeholder: 'Description of your NFT',
                    controller: controller.descriptionController),
                AppDimensions.hSizedBox2,
                TextBox(
                    placeholder:
                        'Collection Name: ${controller.lastCollectionName}',
                    controller: controller.collectionNameController),
                AppDimensions.hSizedBox2,
                Row(
                  children: [
                    AppDimensions.wSizedBox2,
                    Text(
                      'Properties :',
                      style: AppTextStyles.h5().copyWith(
                        fontFamily: AppTextStyles.gilroyMedium,
                        color: AppColors.primary,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.addProperty();
                      },
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(SizeConfig.safeHorizontal! * .01),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AppDimensions.hSizedBox2,
                Obx(
                  () => Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: SizeConfig.safeHorizontal! * .025,
                      runSpacing: SizeConfig.safeVertical! * 0.02,
                      children: controller.properties.value
                          .map<Widget>(
                            (e) => PropertiesChip(
                              label: e['type'],
                              value: e['value'],
                              percent: '',
                              onPressed: () {
                                controller.properties.remove(e);
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.04,
                ),
                PrimaryButton(
                  buttonText: 'Next',
                  width: double.infinity,
                  height: AppDimensions.primaryButtonHeight,
                  onPressed: () {
                    controller.createNFT();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
