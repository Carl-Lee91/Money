import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/function.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/authentication/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _username = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _userIdController.addListener(() {
      setState(() {
        _username = _userIdController.text;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onTapLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => MyFunction.dismissKeyboard(context),
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size48,
                ),
                child: Column(
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
                        Text(
                          "회원가입하기",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size24,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    Column(
                      children: [
                        TextField(
                          cursorColor: ColorTheme.mainColor,
                          decoration: InputDecoration(
                            hintText: "아이디",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.mainColor,
                              ),
                            ),
                          ),
                        ),
                        TextField(
                          cursorColor: ColorTheme.mainColor,
                          decoration: InputDecoration(
                            hintText: "비밀번호",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    CupertinoButton(
                      onPressed: () {},
                      color: ColorTheme.mainColor,
                      child: const Text("회원가입"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "계정이 있으신가요?",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h8,
                        GestureDetector(
                          onTap: _onTapLoginScreen,
                          child: Text(
                            "로그인하기",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                              color: ColorTheme.mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v32,
                    Column(
                      children: [
                        const Text(
                          "소셜계정으로 회원가입하기",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.v10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.github,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.n,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
