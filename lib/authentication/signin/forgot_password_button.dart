import 'package:auth_firebase_riverpod/authentication/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => ForgotPasswordView(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot Password',
            style: TextStyle(
              color: Color(0xFF6574FF),
            ),
          ),
        ),
      ),
    );
  }
}
