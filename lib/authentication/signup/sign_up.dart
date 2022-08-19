import 'package:auth_firebase_riverpod/authentication/signup/signup_button.dart';
import 'package:auth_firebase_riverpod/authentication/signup/email_field.dart';
import 'package:auth_firebase_riverpod/authentication/signup/name_field.dart';
import 'package:auth_firebase_riverpod/authentication/signup/password_field.dart';
import 'package:auth_firebase_riverpod/components/loading_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:form_validators/form_validators.dart';
import 'controller/signup_controller.dart';

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(signUpProvider, (previous, next) {
      if (next.status.isSubmissionInProgress) {
        LoadingSheet.show(context);
      } else if (next.status.isSubmissionFailure) {
        Navigator.of(context).pop();
        ErrorDialog.show(context, "${next.errorMessage}");
      } else if (next.status.isSubmissionSuccess) {
        Navigator.of(context).pop();
      }
    });
    return Column(
      children: const [
        NameField(),
        SizedBox(height: 16),
        EmailField(),
        SizedBox(height: 16),
        PasswordField(),
        SizedBox(height: 24),
        SignUpButton(),
      ],
    );
  }
}
