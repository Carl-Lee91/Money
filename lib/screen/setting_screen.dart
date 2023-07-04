import 'package:flutter/material.dart';
import 'package:money/constant/color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("설정"),
          backgroundColor: ColorTheme.mainColor,
        ),
        body: const AboutListTile(
          applicationVersion: "1.0",
          applicationLegalese: "Copyright",
        ),
      ),
    );
  }
}
