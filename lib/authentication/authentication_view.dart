import 'package:auth_firebase_riverpod/authentication/signin/sign_in.dart';
import 'package:auth_firebase_riverpod/authentication/signup/sign_up.dart';
import 'package:auth_firebase_riverpod/components/animated_button.dart';
import 'package:auth_firebase_riverpod/components/animated_paint.dart';
import 'package:auth_firebase_riverpod/components/auth_switch_button.dart';
import 'package:auth_firebase_riverpod/components/slide_fade_switcher.dart';
import 'package:auth_firebase_riverpod/components/text_input_field.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState
    extends State<AuthenticationView> /*with SingleTickerProviderStateMixin*/ {
  bool _showSignIn = true;
  // late AnimationController _animationController;
  // late Animation<double> _animation;
  bool show = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //       vsync: this, duration: const Duration(milliseconds: 1000));
  //   _animation =
  //       Tween<double>(begin: 1.0, end: 0).animate(_animationController);
  // }

  // @override
  // void didUpdateWidget(covariant AuthenticationView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   show ? _animationController.reverse() : _animationController.forward();
  // }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double devWidth = MediaQuery.of(context).size.width;
    final double paintPadding = devWidth * 0.6 + 130;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, paintPadding, 16, 0),
            child: SlideFadeSwitcher(
              child: _showSignIn ? const SignIn() : const SignUp(),
            ),
          ),
          const AnimatedPaint(
            frontColor: Colors.black,
            backColor: Colors.blue,
            show: true,
            title: 'Create Account',
          ),
          // SizeTransition(
          //   axis: Axis.vertical,
          //   sizeFactor: _animation,
          /*child:*/ const AnimatedPaint(
            frontColor: Color(0xFFF5D973),
            backColor: Colors.blue,
            // show: !_showSignIn,
            title: 'Create Account',
          ),
          // ),
          AuthSwitchButton(
              showSignIn: _showSignIn, // true _showSignIn,
              onTap: () {
                setState(() {
                  _showSignIn = !_showSignIn;
                  // _showSignIn ? _animation : _animationController.reverse();
                });
              }),
        ],
      ),
    );
  }
}
