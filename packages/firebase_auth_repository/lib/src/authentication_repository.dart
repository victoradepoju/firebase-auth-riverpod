// our own custom firebase error

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  final String code;
  const SignUpWithEmailAndPasswordFailure(this.code);
}

class SignInWithEmailAndPasswordFailure implements Exception {
  final String code;
  const SignInWithEmailAndPasswordFailure(this.code);
}

class ForgotPasswordFailure implements Exception {
  final String code;
  const ForgotPasswordFailure(this.code);
}

class SignInWithGoogleFailure implements Exception {}

class SignOutFailure implements Exception {}

class AuthenticationRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.standard();

  Stream<AuthUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) {
        return AuthUser.empty;
      } else {
        return AuthUser(
          id: firebaseUser.uid,
          email: firebaseUser.email,
          name: firebaseUser.displayName,
          emailVerified: firebaseUser.emailVerified,
        );
      }
    });
  }
}
