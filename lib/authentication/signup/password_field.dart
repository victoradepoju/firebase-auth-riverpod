import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../components/text_input_field.dart';
import 'controller/signup_controller.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.password.invalid;
    final SignUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      obscureText: true,
      hintText: 'Password',
      errorText: showError
          ? Password.showPasswordErrorMessage(signUpState.password.error)
          : null,
      onChanged: (password) => SignUpController.onPasswordChange(password),
    );
  }
}
