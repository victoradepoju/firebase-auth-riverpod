import 'package:auth_firebase_riverpod/authentication/signin/sign_in.dart';
import 'package:auth_firebase_riverpod/authentication/signup/sign_up.dart';
import 'package:auth_firebase_riverpod/components/animated_button.dart';
import 'package:auth_firebase_riverpod/components/auth_switch_button.dart';
import 'package:auth_firebase_riverpod/components/text_input_field.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
            child: _showSignIn ? SignIn() : SignUp(),
          ),
          AuthSwitchButton(
              showSignIn: _showSignIn,
              onTap: () {
                setState(() {
                  _showSignIn = !_showSignIn;
                });
              }),
        ],
      ),
    );
  }
}
