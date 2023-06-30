import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';

class LottoScreen extends StatefulWidget {
  const LottoScreen({super.key});

  @override
  State<LottoScreen> createState() => _LottoScreenState();
}

class _LottoScreenState extends State<LottoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.mainColor,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "모의 로또하기",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
