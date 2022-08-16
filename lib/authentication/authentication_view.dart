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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 250, 16, 0),
        child: Column(
          children: [
            TextInputField(_showSignIn),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSignIn = !_showSignIn;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Toggle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
