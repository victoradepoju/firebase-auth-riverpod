import 'package:auth_firebase_riverpod/repository/auth_repo_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'signin_state.dart';

class SignInController extends StateNotifier<SignInState> {
  // just like in SignUpController
  final AuthenticationRepository _authenticationRepository;
  SignInController(this._authenticationRepository) : super(const SignInState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      status: Formz.validate(
        [
          email,
          state.password,
        ],
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);

    state = state.copyWith(
      password: password,
      status: Formz.validate(
        [
          state.email,
          password,
        ],
      ),
    );
  }

  void signInWithEmailAndPassword() async {
    print('checked button');
    if (!state.status.isValidated) return;

    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      state = state.copyWith(status: FormzStatus.submissionSuccess);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}

final signInProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  final authRepository = ref.watch(authRepoProvider);
  return SignInController(authRepository);
});
