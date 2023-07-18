import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/screen/fortune_cookie_screen.dart';
import 'package:money/screen/setting_screen.dart';

class SubAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SubAppbar({super.key, required this.title});

  void _onTabSettingScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingScreen(),
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    void onTabCookie() {
      Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => const FortuneCookieScreen(),
        ),
      );
    }

    return AppBar(
      backgroundColor: ColorTheme.mainColor,
      centerTitle: true,
      elevation: 0,
      title: Text(
        title,
      ),
      leading: GestureDetector(
        onTap: onTabCookie,
        child: Image.asset(
          "assets/images/fortunecookie.png",
          width: 20,
          height: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _onTabSettingScreen(context),
          icon: const FaIcon(
            FontAwesomeIcons.gear,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
