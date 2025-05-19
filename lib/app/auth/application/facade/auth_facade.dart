// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/auth/domain/entities/signup_param.dart';
import 'package:template_app/app/auth/domain/entities/user_param.dart';
import 'package:template_app/app/auth/domain/repo/auth_repo.dart';
import 'package:template_app/core/user/entities/user.dart';

class AuthFacade {
  final AuthRepository _remote;
  AuthFacade({
    required AuthRepository remote,
  }) : _remote = remote;

  Future<Either<String, User>> login({required UserParam userParam}) =>
      _remote.login(userParam: userParam);

  Future<Either<String, User>> signUp({required SignUpParam signUpParam}) =>
      _remote.signUp(signUpParam: signUpParam);

  Future<bool> logout() => _remote.logout();
}
