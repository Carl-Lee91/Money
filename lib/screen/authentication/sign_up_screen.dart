import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money/constant/color.dart';
import 'package:money/constant/utils.dart';
import 'package:money/constant/gap.dart';
import 'package:money/constant/size.dart';
import 'package:money/screen/authentication/login_screen.dart';
import 'package:money/screen/authentication/view_models/sign_up_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  bool _obscureText = true;

  final pattern =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  @override
  void initState() {
    super.initState();
    _userIdController.addListener(() {
      setState(() {
        _email = _userIdController.text;
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

  String? _isIdValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "유효하지 않은 이메일입니다.";
    }
    return null;
  }

  bool _isPasswordLengthValid() {
    return _password.isNotEmpty &&
        _password.length >= 8 &&
        _password.length <= 20;
  }

  bool _isPasswordPatternValid() {
    return pattern.hasMatch(_password);
  }

  void _toggleObscure() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onTapSubmit() {
    if (_isIdValid() != null ||
        _email.isEmpty ||
        !_isPasswordLengthValid() ||
        !_isPasswordPatternValid()) return;
    final state = ref.read(signUpFrom.notifier).state;
    ref.read(signUpFrom.notifier).state = {
      "email": _email,
      "password": _password
    };
    ref.read(signUpProvider.notifier).signUp(context);
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
                          controller: _userIdController,
                          autocorrect: false,
                          cursorColor: ColorTheme.mainColor,
                          decoration: InputDecoration(
                            hintText: "아이디",
                            errorText: _isIdValid(),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.mainColor,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v10,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '아이디는 이메일 형식으로 해야 합니다.',
                              style: TextStyle(
                                fontSize: Sizes.size12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gaps.v10,
                        TextField(
                          controller: _passwordController,
                          autocorrect: false,
                          cursorColor: ColorTheme.mainColor,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: "비밀번호",
                            suffix: GestureDetector(
                              onTap: _toggleObscure,
                              child: FaIcon(
                                (_obscureText == true
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash),
                                color: Colors.grey.shade500,
                                size: Sizes.size16,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ColorTheme.mainColor,
                              ),
                            ),
                          ),
                        ),
                        Gaps.v10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '비밀번호는 아래의 조건을 만족시켜야 합니다:',
                              style: TextStyle(
                                fontSize: Sizes.size12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Gaps.v10,
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circleCheck,
                                  size: Sizes.size16,
                                  color: _isPasswordLengthValid()
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                Gaps.h4,
                                Text(
                                  '8자 이상 20자 이하',
                                  style: TextStyle(
                                    fontSize: Sizes.size14,
                                    color: _isPasswordLengthValid()
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v2,
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circleCheck,
                                  size: Sizes.size16,
                                  color: _isPasswordPatternValid()
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                Gaps.h4,
                                Text(
                                  '영문자, 숫자, 특수문자 포함',
                                  style: TextStyle(
                                    fontSize: Sizes.size14,
                                    color: _isPasswordPatternValid()
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v20,
                    CupertinoButton(
                      onPressed: _onTapSubmit,
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
