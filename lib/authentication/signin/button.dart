// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_firebase_riverpod/components/loading_error.dart';
import 'package:flutter/material.dart';

import '../../components/animated_button.dart';
import '../../components/rounded_button_style.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: () {
        ErrorDialog.show(context, 'failed loading');
      },
      child: const RoundedButtonStyle(title: 'Sign In'),
    );
  }
}
