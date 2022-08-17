import 'package:auth_firebase_riverpod/components/animated_button.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: const Text(
          'Sign In With Google',
          style: TextStyle(
            color: Color(0xFF9A9A9A),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
