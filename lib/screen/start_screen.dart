import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/welcome_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _toTheNextScreen();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  void _toTheNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    _animationController.forward();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WelcomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        reverseTransitionDuration: const Duration(milliseconds: 100),
      ),
    );
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
        backgroundColor: ColorTheme.mainColor,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.crown,
              color: ColorTheme.whiteColor,
              size: Sizes.size60 + Sizes.size60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.whiteColor,
                  size: Sizes.size60,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.whiteColor,
                  size: Sizes.size60,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: ColorTheme.whiteColor,
                  size: Sizes.size60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
