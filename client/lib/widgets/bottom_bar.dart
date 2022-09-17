import 'package:client/themes/app_colors.dart';
import 'package:client/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  final int index;

  final ValueChanged<int> onChangedTab;

  const BottomBar({required this.index, required this.onChangedTab, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final placeholder = Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: null,
        icon: Icon(Icons.no_cell),
      ),
    );

    return BottomAppBar(
      color: Colors.black,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTabItem(
            index: 0,
            icon: Icon(Icons.explore),
            title: 'Home',
            context: context,
          ),
          buildTabItem(
            index: 1,
            icon: Icon(Icons.search),
            title: 'Search',
            context: context,
          ),
          placeholder,
          buildTabItem(
            index: 2,
            icon: Icon(Icons.favorite),
            title: 'favorite',
            context: context,
          ),
          buildTabItem(
            index: 3,
            icon: Icon(Icons.person),
            title: 'Profile',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget buildTabItem(
      {required int index,
      required Icon icon,
      required String title,
      required BuildContext context}) {
    Color TabColor = index == this.index ? AppColors.primary : AppColors.white;

    return Expanded(
      child: InkWell(
        onTap: () => this.onChangedTab(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.safeVertical! * 0.01,
            ),
            Icon(icon.icon, color: TabColor),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.005,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: TabColor,
                    fontFamily: 'Gilroy',
                    // fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.008,
            ),
          ],
        ),
      ),
    );
  }
}
