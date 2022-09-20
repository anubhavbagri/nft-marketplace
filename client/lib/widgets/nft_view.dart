import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NftView extends StatefulWidget {
  final Image image;
  final Image? creatorImage;
  final String creator;
  final String subtitle;
  final String title;
  final String likes;

  const NftView(
      {super.key,
      required this.image,
      required this.creator,
      required this.subtitle,
      required this.title,
      required this.likes,
      this.creatorImage});

  @override
  State<NftView> createState() => _NftViewState();
}

class _NftViewState extends State<NftView> {
  bool isFavorited = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // height: SizeConfig.safeHorizontal! * 1.1,
        width: SizeConfig.safeHorizontal! * 0.9,
        color: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: SizeConfig.safeHorizontal! * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColors.white,
                          backgroundImage: widget.creatorImage?.image,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.creator,
                                style: AppTextStyles.h5().copyWith(
                                  fontFamily: AppTextStyles.gilroyBold,
                                ),
                              ),
                              Text(
                                widget.subtitle,
                                style: AppTextStyles.small().copyWith(
                                  fontFamily: AppTextStyles.gilroyRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (() {}),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.buttonBorderRadius),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                      // elevation: MaterialStateProperty.all(3),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(
                      "Follow",
                      style: AppTextStyles.small().copyWith(
                        color: AppColors.white,
                        fontFamily: AppTextStyles.gilroyBold,
                      ),
                    ),
                  ),
                ],
              ),
              AppDimensions.hSizedBox2,
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(10),
              //   child: ConstrainedBox(
              //     constraints: BoxConstraints(
              //       minHeight: SizeConfig.safeVertical! * 0.7,
              //       maxWidth: SizeConfig.safeHorizontal! * 0.8,
              //     ),
              //     child: Container(
              //       // height: double.infinity,
              //       // height: SizeConfig.safeHorizontal! * 0.7,
              //       width: SizeConfig.safeHorizontal! * 0.8,
              //       color: Colors.white.withOpacity(0.1),
              //       child: FittedBox(
              //         fit: BoxFit.fitWidth,
              //         child: widget.image,
              //       ),
              //     ),
              //   ),
              // ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: widget.image,
                  ),
                  Positioned(
                    top: 330,
                    left: 15,
                    child: Text(
                      "${widget.title}",
                      style: AppTextStyles.small().copyWith(
                        color: AppColors.white,
                        fontFamily: AppTextStyles.gilroySemiBold,
                      ),
                    ),
                  ),
                ],
              ),
              // AppDimensions.hSizedBox2,
              Container(
                width: SizeConfig.safeHorizontal! * 0.9,
                height: SizeConfig.safeVertical! * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: SizeConfig.safeHorizontal! * 0.28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: isFavorited
                                ? const Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                            onPressed: isFavorited
                                ? () {
                                    setState(() {
                                      isFavorited = false;
                                    });
                                  }
                                : () {
                                    setState(() {
                                      isFavorited = true;
                                    });
                                  },
                          ),
                          Text(
                            "${widget.likes} likes",
                            style: AppTextStyles.small().copyWith(
                              fontFamily: AppTextStyles.gilroyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: isSaved
                          ? const Icon(
                              Icons.bookmark,
                              size: 30,
                            )
                          : const Icon(
                              Icons.bookmark_border,
                              size: 30,
                            ),
                      color: Colors.white,
                      onPressed: isSaved
                          ? () {
                              setState(() {
                                isSaved = false;
                              });
                            }
                          : () {
                              setState(() {
                                isSaved = true;
                              });
                            },
                    ),
                  ],
                ),
              ),
              AppDimensions.hSizedBox1,
            ],
          ),
        ),
      ),
    );
  }
}
