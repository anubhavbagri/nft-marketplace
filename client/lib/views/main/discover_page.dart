import 'package:client/controllers/welcome_controller.dart';
import 'package:client/themes/app_colors.dart';
import 'package:client/themes/app_dimensions.dart';
import 'package:client/themes/app_text_styles.dart';
import 'package:client/themes/background.dart';
import 'package:client/utils/global_utils.dart';
import 'package:client/utils/size_config.dart';
import 'package:client/widgets/collection_list.dart';
import 'package:client/widgets/nft_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PrimaryBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  // expandedHeight: AppDimensions.heading1TextSize * 0,
                  toolbarHeight: SizeConfig.safeVertical! * 0.12,
                  floating: true,
                  snap: true,
                  // pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 60, 20, 0),
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: SizeConfig.safeVertical! * 0.05,
                                width: SizeConfig.safeVertical! * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    formatAddress(WelcomeController.to.account),
                                    style: AppTextStyles.h5().copyWith(
                                      fontFamily: AppTextStyles.gilroyBold,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: SizeConfig.safeVertical! * 0.05,
                                width: SizeConfig.safeVertical! * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black.withOpacity(0.3),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${WelcomeController.to.balance} MAT',
                                    style: AppTextStyles.h5().copyWith(
                                      fontFamily: AppTextStyles.gilroyBold,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: SizeConfig.safeVertical! * 0.4,
                    width: SizeConfig.safeHorizontal! * 1,
                    // color: Colors.black,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Text(
                            "Top Collections",
                            // textAlign: TextAlign.start,
                            style: AppTextStyles.h4().copyWith(
                              fontFamily: AppTextStyles.gilroyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 10, 0),
                          child: ListView(
                            shrinkWrap: true,
                            children: <CollectionList>[
                              CollectionList(
                                title: "Collection",
                                user:
                                    "0xd96fEacE7034E7cFCD90102500a70A9358535dcE",
                                image1:
                                    Image.asset("assets/images/flamingo.jpeg"),
                                image2: Image.asset("assets/images/alien.jpeg"),
                                image3: Image.asset("assets/images/panda.jpeg"),
                              ),
                              CollectionList(
                                title: "Collection",
                                user:
                                    "0xDb847D8d9aa3dFaaD0BDdc3B8672eaEBba0cdF67",
                                image1:
                                    Image.asset("assets/images/flamingo.jpeg"),
                                image2: Image.asset("assets/images/alien.jpeg"),
                                image3: Image.asset("assets/images/panda.jpeg"),
                              ),
                              CollectionList(
                                title: "Collection",
                                user:
                                    "0x55605337c1ee7e3e798F422cE1ca09A481424456",
                                image1:
                                    Image.asset("assets/images/flamingo.jpeg"),
                                image2: Image.asset("assets/images/alien.jpeg"),
                                image3: Image.asset("assets/images/panda.jpeg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      NftView(
                          image: Image.asset("assets/images/flamingo.jpeg"),
                          creator: "Beeple",
                          subtitle: "Nirvana",
                          title: "Flocking with the flamingos",
                          likes: "1.2k",
                          creatorImage:
                              Image.asset("assets/images/panda.jpeg")),
                      AppDimensions.hSizedBox2,
                      NftView(
                          image: Image.asset("assets/images/panda.jpeg"),
                          creator: "Beeple",
                          subtitle: "Nirvana",
                          title: "Panda boi",
                          likes: "1.2k",
                          creatorImage:
                              Image.asset("assets/images/alien.jpeg")),
                      AppDimensions.hSizedBox2,
                      NftView(
                          image: Image.asset("assets/images/alien.jpeg"),
                          creator: "Beeple",
                          subtitle: "Nirvana",
                          title: "Alien Amigos",
                          likes: "1.2k",
                          creatorImage:
                              Image.asset("assets/images/flamingo.jpeg")),
                    ],
                  ),
                  AppDimensions.hSizedBox3,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
