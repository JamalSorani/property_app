// 📦 Package imports:
import 'package:either_dart/either.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';

// 🌎 Project imports:
import '../../../../core/user/entities/user.dart';
import '../entities/signup_param.dart';
import '../entities/user_param.dart';

abstract class AuthRepository {
  AuthRepository();

  Future<Either<String, User>> login({
    required UserParam userParam,
  });

  Future<Either<String, User>> signUp({
    required SignUpParam signUpParam,
  });

  Stream<AuthStatus> get authStatusStream;

  Future<bool> logout();
}
