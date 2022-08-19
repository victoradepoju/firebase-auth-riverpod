// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/animated_button.dart';
import '../../components/rounded_button_style.dart';
import 'package:form_validators/form_validators.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final signInController = ref.read(signInProvider.notifier);
    final bool isValidated = signInState.status.isValidated;
    return AnimatedButton(
      onTap: isValidated
          ? () => signInController.signInWithEmailAndPassword()
          : null,
      child: const RoundedButtonStyle(title: 'Sign In'),
    );
  }
}
