// 📦 Package imports:
import 'package:either_dart/either.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import '../../../../common/injection/injection.dart';
import '../../../../common/network/exception/error_handler.dart';
import '../../../../core/user/entities/user.dart';
import '../../domain/entities/signup_param.dart';
import '../../domain/entities/user_param.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/local/auth_local.dart';
import '../data_source/local/reactive_token_storage.dart';
import '../data_source/remote/auth_remote.dart';
import '../models/auth_token_dio.dart';

class AuthRepoImp implements AuthRepository {
  final AuthRemote _remote;
  final ReactiveTokenStorage reactiveTokenStorage;
  final AuthLocal storageService;

  AuthRepoImp({
    required AuthRemote remote,
    required this.reactiveTokenStorage,
    required this.storageService,
  }) : _remote = remote;

  @override
  Future<Either<String, User>> login({required UserParam userParam}) {
    return throwAppException(() async {
      final response = await _remote.login(userParam: userParam);
      _saveUser(response);
      return response;
    });
  }

  @override
  Future<Either<String, User>> signUp({required SignUpParam signUpParam}) {
    return throwAppException(() async {
      final response = await _remote.signUp(signUpParam: signUpParam);
      _saveUser(response);
      return response;
    });
  }

  _saveUser(User user) {
    reactiveTokenStorage.write(AuthTokenModel(
        accessToken: user.accessToken, refreshToken: user.refreshToken));
    storageService.setUser(user);
  }

  @override
  Stream<AuthStatus> get authStatusStream =>
      reactiveTokenStorage.authenticationStatus;

  @override
  Future<bool> logout() async {
    await storageService.removeUser();
    await reactiveTokenStorage.delete();
    await getIt<FlutterSecureStorage>().deleteAll();
    await getIt<ReactiveTokenStorage>().loadToken();
    return await getIt<SharedPreferences>().clear();
  }
}
