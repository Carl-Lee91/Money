import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/utils.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/authentication/sign_up_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onTapSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
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
                          "계속하려면 로그인해주세요",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size24,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: ColorTheme.mainColor,
                            decoration: InputDecoration(
                              hintText: "아이디",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.mainColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              return null;
                            },
                          ),
                          TextFormField(
                            cursorColor: ColorTheme.mainColor,
                            decoration: InputDecoration(
                              hintText: "비밀번호",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorTheme.mainColor,
                                ),
                              ),
                            ),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    Gaps.v20,
                    CupertinoButton(
                      onPressed: () {},
                      color: ColorTheme.mainColor,
                      child: const Text("로그인"),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "계정이 없으신가요?",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        Gaps.h8,
                        GestureDetector(
                          onTap: _onTapSignUpScreen,
                          child: Text(
                            "회원가입하기",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                              color: ColorTheme.mainColor,
                            ),
                          ),
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
