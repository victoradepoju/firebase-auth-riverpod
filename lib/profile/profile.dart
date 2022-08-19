import 'package:auth_firebase_riverpod/authentication/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authProvider.notifier);
    // authProvider return AuthController which is of type SignUpState.
    // SignUpState has 'user' [AuthUser] property.
    final authUser = ref.watch(authProvider).user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('user id: ${authUser.id}'),
            Text('user email: ${authUser.email}'),
            Text('email verified: ${authUser.emailVerified}'),
            TextButton(
              onPressed: () {
                authController.onSignOut();
              },
              child: const Text('Signout'),
            ),
          ],
        ),
      ),
    );
  }
}
