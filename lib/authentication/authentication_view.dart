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
            child: Column(
              children: [
                TextInputField(
                  hintText: 'Email',
                  onChanged: (_) {},
                ),
                TextInputField(
                  hintText: 'Password',
                  onChanged: (_) {},
                ),
                AnimatedButton(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5D973),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
