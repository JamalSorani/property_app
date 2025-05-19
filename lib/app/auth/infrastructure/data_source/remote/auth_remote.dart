// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import '../../../../../common/constant/src/url.dart';
import '../../../../../common/network/exception/error_handler.dart';
import '../../../../../core/user/entities/user.dart';
import '../../../domain/entities/signup_param.dart';
import '../../../domain/entities/user_param.dart';

class AuthRemote {
  final Dio _dio;

  const AuthRemote(Dio dio) : _dio = dio;

  Future<User> login({required UserParam userParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.login,
        data: await userParam.toJson(),
      );
      return User.fromMap(response.data);
    });
  }

  Future<User> signUp({required SignUpParam signUpParam}) {
    return throwDioException(() async {
      final response = await _dio.post(
        AppUrl.signup,
        data: await signUpParam.toMap(),
      );
      return User.fromMap(response.data);
    });
  }
}
