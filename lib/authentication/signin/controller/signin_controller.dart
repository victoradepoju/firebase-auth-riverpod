import 'package:equatable/equatable.dart';
import 'package:form_validators/form_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'signin_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController() : super(SignInState());

  void onEmailChanged(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);

    state = state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    );
  }

  void signInWithEmailAndPassword() async {
    if (!state.status.isValidated) return;
    print('signIn');
  }
}

final signInProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  return SignInController();
});
