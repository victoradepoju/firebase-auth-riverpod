// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_firebase_riverpod/components/slide_fade_switcher.dart';
import 'package:flutter/material.dart';

const _kTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xFF9A9A9A),
);

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;
  const AuthSwitchButton({
    Key? key,
    required this.showSignIn,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: SlideFadeSwitcher(
            // Note: Key is needed because AnimatedSwitcher will not show animation
            // if new and old child are same widget (in this case, Text widget).
            // The key explicitly tells it that they are different widgets.
            child: showSignIn
                ? const Text(
                    "Don't have account? Sign Up",
                    style: _kTextStyle,
                    key: ValueKey('SignIn'),
                  )
                : const Text(
                    'Already have account? Sign In',
                    style: _kTextStyle,
                    key: ValueKey('SignUp'),
                  ),
          ),
        ),
      ),
    );
  }
}
