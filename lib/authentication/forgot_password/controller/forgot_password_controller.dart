import 'package:auth_firebase_riverpod/repository/auth_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'forgot_password_state.dart';

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate(
        [email],
      ),
    );
  }

  Future<void> forgotPassword() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.forgotPassword(email: state.email.value);
      state = state.copyWith(status: FormzStatus.submissionSuccess);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordController, ForgotPasswordState>((ref) {
  return ForgotPasswordController(ref.watch(authRepoProvider));
});
