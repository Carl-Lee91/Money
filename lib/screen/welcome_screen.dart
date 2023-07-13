import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/authentication/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _onTabNext(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "openingSymbol",
                child: Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.crown,
                      color: ColorTheme.mainColor,
                      size: Sizes.size60 + Sizes.size60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money_rounded,
                          color: ColorTheme.mainColor,
                          size: Sizes.size60,
                        ),
                        Icon(
                          Icons.attach_money_rounded,
                          color: ColorTheme.mainColor,
                          size: Sizes.size60,
                        ),
                        Icon(
                          Icons.attach_money_rounded,
                          color: ColorTheme.mainColor,
                          size: Sizes.size60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "일확천금에 오신 것을 환영합니다.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size24,
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v40,
              CupertinoButton(
                color: ColorTheme.mainColor,
                onPressed: () => _onTabNext(context),
                child: const Text(
                  "시작하기",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
