import 'package:auth_firebase_riverpod/components/loading_error.dart';
import 'package:auth_firebase_riverpod/components/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:form_validators/form_validators.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  String _getButtonText(FormzStatus status) {
    if (status.isSubmissionInProgress) {
      return 'requesting';
    } else if (status.isSubmissionFailure) {
      return 'failed';
    } else if (status.isSubmissionSuccess) {
      return 'done';
    } else {
      return 'request';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ForgotPasswordState>(forgotPasswordProvider, (previous, next) {
      if (next.status.isSubmissionFailure) {
        Navigator.of(context).pop();
        ErrorDialog.show(context, '${next.errorMessage}');
      }
    });

    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final status = forgotPasswordState.status;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                errorText: Email.showEmailErrorMessage(
                    forgotPasswordState.email.error),
                hintText: 'Please enter your email',
                onChanged: (email) {
                  ref
                      .read(forgotPasswordProvider.notifier)
                      .onEmailChange(email);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: status.isSubmissionInProgress
                        ? null
                        : () {
                            Navigator.of(context).pop();
                          },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: status.isSubmissionInProgress ||
                            status.isSubmissionSuccess
                        ? null
                        : () {
                            ref
                                .watch(forgotPasswordProvider.notifier)
                                .forgotPassword();
                          },
                    child: Text(_getButtonText(status)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
