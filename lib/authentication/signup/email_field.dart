import 'package:auth_firebase_riverpod/authentication/signup/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../components/text_input_field.dart';

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.email.invalid;
    final SignUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: 'Email',
      errorText: showError
          ? Email.showEmailErrorMessage(signUpState.email.error)
          : null,
      onChanged: (email) => SignUpController.onEmailChange(email),
    );
  }
}
