// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signin_controller.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
        status,
      ];
}
