// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final bool emailVerified;
  const AuthUser({
    required this.id,
    this.email,
    this.name,
    this.emailVerified = false,
  });

  // id is required.
  static const empty = AuthUser(id: '');

  bool get isEmpty => this == empty;

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        emailVerified,
      ];
}
