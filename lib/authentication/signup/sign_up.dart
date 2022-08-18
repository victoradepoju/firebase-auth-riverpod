import 'package:auth_firebase_riverpod/authentication/signup/button.dart';
import 'package:auth_firebase_riverpod/authentication/signup/email.dart';
import 'package:auth_firebase_riverpod/authentication/signup/name.dart';
import 'package:auth_firebase_riverpod/authentication/signup/password.dart';
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
        Email(),
        const SizedBox(height: 16),
        Password(),
        const SizedBox(height: 24),
        SignUpButton(),
      ],
    );
  }
}
