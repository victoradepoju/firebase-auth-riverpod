import 'package:auth_firebase_riverpod/authentication/google_signin/google_signin_button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/email_field.dart';
import 'package:auth_firebase_riverpod/authentication/signin/password_field.dart';
import 'package:auth_firebase_riverpod/authentication/signin/signin_button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/forgot_password_button.dart';
import 'package:auth_firebase_riverpod/authentication/signin/or_divider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../components/loading_error.dart';
import 'controller/signin_controller.dart';
import 'package:flutter/material.dart';

class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(signInProvider, (previous, next) {
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
        EmailField(),
        SizedBox(height: 16),
        PasswordField(),
        ForgotPasswordButton(),
        SizedBox(height: 24),
        SignInButton(),
        OrDivider(),
        GoogleSignInButton(),
      ],
    );
  }
}
