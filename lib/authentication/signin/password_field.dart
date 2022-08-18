import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/text_input_field.dart';
import 'controller/signin_controller.dart';
import 'package:form_validators/form_validators.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.password.invalid;
    final SignInController = ref.read(signInProvider.notifier);
    return TextInputField(
      obscureText: true,
      errorText: showError
          ? Password.showPasswordErrorMessage(signInState.password.error)
          : null,
      hintText: 'Password',
      onChanged: (password) => SignInController.onPasswordChanged(password),
    );
  }
}
