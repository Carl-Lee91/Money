import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/authentificatiom/sign_up_screen.dart';

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
        pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
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
        backgroundColor: Colors.yellow.shade700,
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.crown,
              color: Colors.white,
              size: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white,
                  size: 60,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white,
                  size: 60,
                ),
                Icon(
                  Icons.attach_money_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
