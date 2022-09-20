import 'package:client/themes/app_text_styles.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:truncate/truncate.dart';

class CollectionList extends StatefulWidget {
  final Image image1;
  final Image image2;
  final Image image3;
  final String title;
  final String user;

  final Function()? onTap;

  const CollectionList({
    super.key,
    required this.title,
    required this.user,
    this.onTap,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  @override
  State<CollectionList> createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _thumbnail(
              image1: widget.image1,
              image2: widget.image2,
              image3: widget.image3),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _NFTDescription(
                title: widget.title,
                user: widget.user,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: IconButton(
              icon: isFavorited
                  ? const Icon(
                      Icons.favorite,
                      size: 30,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
              color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}

class _NFTDescription extends StatelessWidget {
  const _NFTDescription({
    required this.title,
    required this.user,
  });

  final String title;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppTextStyles.h5().copyWith(
              fontFamily: AppTextStyles.gilroyRegular,
              color: Colors.white,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            "by ${truncate(user, 11, omission: '...', position: TruncatePosition.middle)}",
            overflow: TextOverflow.fade,
            style: AppTextStyles.small().copyWith(
              fontFamily: AppTextStyles.gilroyRegular,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}

class _thumbnail extends StatelessWidget {
  const _thumbnail({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
  });
  final Image image1;
  final Image image2;
  final Image image3;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: SizeConfig.safeVertical! * 0.1,
      width: SizeConfig.safeHorizontal! * 0.25,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: SizeConfig.safeHorizontal! * 0.15,
                width: SizeConfig.safeHorizontal! * 0.15,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: image1,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: SizeConfig.safeHorizontal! * 0.15,
                width: SizeConfig.safeHorizontal! * 0.15,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: image2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: SizeConfig.safeHorizontal! * 0.15,
                width: SizeConfig.safeHorizontal! * 0.15,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: image3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
