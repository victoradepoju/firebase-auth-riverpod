import 'package:auth_firebase_riverpod/authentication/signup/button.dart';
import 'package:auth_firebase_riverpod/authentication/signup/email_field.dart';
import 'package:auth_firebase_riverpod/authentication/signup/name_field.dart';
import 'package:auth_firebase_riverpod/authentication/signup/password_field.dart';
import 'package:auth_firebase_riverpod/components/animated_button.dart';
import 'package:auth_firebase_riverpod/components/text_input_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameField(),
        const SizedBox(height: 16),
        EmailField(),
        const SizedBox(height: 16),
        PasswordField(),
        const SizedBox(height: 24),
        SignUpButton(),
      ],
    );
  }
}
