import 'package:auth_firebase_riverpod/authentication/controller/authentication_controller.dart';
import 'package:auth_firebase_riverpod/repository/auth_repo_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GoogleSignInState {
  initial,
  loading,
  success,
  error,
}

class GoogleSignInController extends StateNotifier<GoogleSignInState> {
  final AuthenticationRepository _authenticationRepository;
  GoogleSignInController(this._authenticationRepository)
      : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle() async {
    state = GoogleSignInState.loading;

    try {
      // below returns a boolean.
      final isNewUser = await _authenticationRepository.signInWithGoogle();
      if (isNewUser != null && isNewUser) {
        // write to database
        // call cloud firestore repository
      }
      state = GoogleSignInState.success;
    } on SignInWithGoogleFailure catch (_) {
      state = GoogleSignInState.error;
    }
  }
}

final googleSignInProvider =
    StateNotifierProvider<GoogleSignInController, GoogleSignInState>((ref) {
  return GoogleSignInController(ref.watch(authRepoProvider));
});
