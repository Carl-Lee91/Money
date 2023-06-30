import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/appbar/main_appbar.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/coin_screen.dart';
import 'package:money/screen/lotto_screen.dart';

class FortuneCookieScreen extends StatefulWidget {
  const FortuneCookieScreen({super.key});

  @override
  State<FortuneCookieScreen> createState() => _FortuneCookieScreenState();
}

class _FortuneCookieScreenState extends State<FortuneCookieScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  );
  late final Animation<double> _opacityAnimation =
      Tween(begin: 1.0, end: 0.0).animate(_animationController);

  bool _showFortune = true;

  void _onTabRresult() {
    if (_showFortune) {
      _animationController.forward().then(
        (value) {
          setState(() {
            _showFortune = false;
          });
          _animationController.reverse();
        },
      );
    }
  }

  int randomNumber(DateTime date) {
    int todayNumber = date.year + date.month + date.day;
    Random random = Random(todayNumber);
    int randomNumber = random.nextInt(100);

    int resultNumber = randomNumber % 10;

    return resultNumber;
  }

  late int printNumber;
  String printText = "";

  String changeToText(int number) {
    if (number >= 1 && number <= 3) {
      return '나쁨';
    } else if (number >= 4 && number <= 6) {
      return '보통';
    } else if (number >= 7 && number <= 9) {
      return '좋음';
    } else {
      return '극악';
    }
  }

  void _onTabLotto() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LottoScreen(),
      ),
    );
  }

  void _onTabCoin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CoinScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    printNumber = randomNumber(currentDate);
    printText = changeToText(printNumber);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppbar(),
        body: Center(
          child: GestureDetector(
            onTap: _onTabRresult,
            child: AnimatedBuilder(
              animation: _opacityAnimation,
              builder: (context, child) => Opacity(
                opacity: _opacityAnimation.value,
                child: _showFortune
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/fortunecookie.png",
                            width: 250,
                            height: 250,
                          ),
                          Gaps.v28,
                          const Text(
                            "오늘의 운세를 확인하세요!",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size24,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "오늘 당신의 행운은",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size24,
                            ),
                          ),
                          Text(
                            printText,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size36,
                              color: ColorTheme.mainColor,
                            ),
                          ),
                          const Text(
                            "입니다",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size24,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (context, child) => Opacity(
            opacity: _opacityAnimation.value,
            child: _showFortune
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        CupertinoButton(
                          color: ColorTheme.mainColor,
                          onPressed: _onTabLotto,
                          child: const Text(
                            "로또하기",
                          ),
                        ),
                        Gaps.h10,
                        CupertinoButton(
                          color: ColorTheme.mainColor,
                          onPressed: _onTabCoin,
                          child: const Text(
                            "코인하기",
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
