// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:equatable/equatable.dart';

class UserParam extends Equatable {
  final String email;
  final String password;
  const UserParam({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];

  UserParam copyWith({
    String? email,
    String? password,
  }) {
    return UserParam(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'email': email,
      'password': password,
    };
  }
}
