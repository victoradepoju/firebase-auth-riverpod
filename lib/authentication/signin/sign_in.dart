import 'package:auth_firebase_riverpod/authentication/google_signin/google_signin_button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/forgot_password_button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/or_divider.dart';
import 'package:auth_firebase_riverpod/authentication/signup/email.dart';
import 'package:auth_firebase_riverpod/authentication/signup/password.dart';
import 'package:auth_firebase_riverpod/components/animated_button.dart';
import 'package:auth_firebase_riverpod/components/text_input_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Email(),
        SizedBox(height: 16),
        Password(),
        ForgotPasswordButton(),
        SizedBox(height: 24),
        SignInButton(),
        OrDivider(),
        GoogleSignInButton(),
      ],
    );
  }
}
