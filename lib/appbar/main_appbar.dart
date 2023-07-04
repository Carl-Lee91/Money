import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/size.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      centerTitle: true,
      elevation: 0,
      title: Hero(
        tag: "openingSymbol",
        child: Column(
          children: [
            FaIcon(
              FontAwesomeIcons.crown,
              color: ColorTheme.mainColor,
              size: Sizes.size32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.mainColor,
                  size: Sizes.size16,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.mainColor,
                  size: Sizes.size16,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.mainColor,
                  size: Sizes.size16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
