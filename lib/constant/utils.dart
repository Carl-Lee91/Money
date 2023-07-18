import 'package:flutter/material.dart';

class MyFunction {
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
