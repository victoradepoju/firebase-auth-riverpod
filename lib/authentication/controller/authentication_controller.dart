import 'dart:async';

import 'package:auth_firebase_riverpod/repository/auth_repo_provider.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authRepository; //from local package

  // when we listen to a stream, it returns StreamSubscription. Hence the need
  // to store this variable and dispose later (cancel).
  late final StreamSubscription _streamSubscription;

  AuthController(this._authRepository)
      : super(const AuthenticationState.unauthenticated()) {
    // we need to listen to the user steam immediately to get the authstate.
    _streamSubscription =
        _authRepository.user.listen((user) => _onUserChanged(user));
  }

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user);
    }
  }

  void onSignOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

final authProvider =
    StateNotifierProvider<AuthController, AuthenticationState>((ref) {
  final authRepository = ref.watch(authRepoProvider);
  return AuthController(authRepository);
});
