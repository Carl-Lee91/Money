import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/size.dart';

class FortuneCookieScreen extends StatefulWidget {
  const FortuneCookieScreen({super.key});

  @override
  State<FortuneCookieScreen> createState() => _FortuneCookieScreenState();
}

class _FortuneCookieScreenState extends State<FortuneCookieScreen> {
  final Color mainColor = Colors.amber.shade700;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: Hero(
            tag: "openingSymbol",
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.crown,
                  color: mainColor,
                  size: Sizes.size32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                      color: mainColor,
                      size: Sizes.size16,
                    ),
                    Icon(
                      Icons.attach_money_rounded,
                      color: mainColor,
                      size: Sizes.size16,
                    ),
                    Icon(
                      Icons.attach_money_rounded,
                      color: mainColor,
                      size: Sizes.size16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
