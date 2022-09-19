import 'dart:io';

import 'package:client/controllers/collection_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCollectionPage extends GetView<CollectionController> {
  const CreateCollectionPage({Key? key}) : super(key: key);

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
                    width: AppDimensions.primaryButtonWidth,
                    height: AppDimensions.primaryButtonWidth,
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
                AppDimensions.hSizedBox3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
