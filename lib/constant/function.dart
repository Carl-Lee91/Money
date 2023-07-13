import 'package:flutter/cupertino.dart';

class MyFunction {
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
