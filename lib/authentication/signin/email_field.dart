import 'package:auth_firebase_riverpod/authentication/signin/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/text_input_field.dart';
import 'package:form_validators/form_validators.dart';

class EmailField extends ConsumerWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.email.invalid;
    final signInController = ref.read(signInProvider.notifier);
    return TextInputField(
      hintText: 'Email',
      errorText: showError
          ? Email.showEmailErrorMessage(signInState.email.error)
          : null,
      onChanged: (email) => signInController.onEmailChange(email),
    );
  }
}
