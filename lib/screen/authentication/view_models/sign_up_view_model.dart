import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money/screen/authentication/repos/authentication_repos.dart';
import 'package:money/screen/fortune_cookie_screen.dart';
import 'package:riverpod/riverpod.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpFrom);
    state = await AsyncValue.guard(
      () async => await _authRepo.signUp(
        form["email"],
        form["password"],
      ),
    );
    if (state.hasError) {
      final snack = SnackBar(
        showCloseIcon: true,
        content: Text(
          (state.error as FirebaseException).message ??
              "Something gonna wrong.",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FortuneCookieScreen(),
        ),
      );
    }
  }
}

final signUpFrom = StateProvider((ref) => {});
final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
