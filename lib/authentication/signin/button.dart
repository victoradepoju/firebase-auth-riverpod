// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../components/animated_button.dart';
import '../../components/rounded_button_style.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onTap: () {
        ErrorDialog.show(context);
      },
      child: const RoundedButtonStyle(title: 'Sign In'),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => const ErrorDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Okay',
              // textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
