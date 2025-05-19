// ignore_for_file: deprecated_member_use

// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import '../constant/app_string.dart';
import 'exception/app_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.error is SocketException) {
      err =
          err.copyWith(error: AppException.known("لا يوجد إتصال في الانترنت"));
      handler.next(err);
    } else if (err.response.toString().isNotEmpty &&
        err.response?.data?["message"] != null) {
      if (err.response?.data?["message"]
              .toLowerCase()
              .contains("user not found") ||
          err.response?.data?["message"]
              .toLowerCase()
              .contains("email or password wrong")) {
        err = err.copyWith(error: AppException.known(AppString.userNotFound));
        handler.next(err);
      } else if (err.response?.data?["message"]
          .toLowerCase()
          .contains("email is not exist")) {
        err = err.copyWith(
            error: AppException.known(AppString.emailNotExistMessage));
        handler.next(err);
      } else if (err.response?.data?["message"]
          .toLowerCase()
          .contains("wrong code")) {
        err = err.copyWith(error: AppException.known(AppString.wrongCode));
        handler.next(err);
      } else if (err.response?.data?["message"]
          .toLowerCase()
          .contains("already exist")) {
        err = err.copyWith(error: AppException.known(AppString.alreadyExist));
        handler.next(err);
      } else {
        err = err.copyWith(error: AppException.known('Please Try Again Later'));
        handler.next(err);
      }
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      err =
          err.copyWith(error: AppException.known('لا يوجد إتصال في الانترنت'));
      handler.next(err);
    } else if (err.type == DioExceptionType.badResponse &&
        err.response?.statusCode == 500) {
      err = err.copyWith(error: AppException.known('الرجاء المحاولة لاحقاً'));
      handler.next(err);
    } else if (err.type == DioExceptionType.badResponse) {
      var data = err.response?.data;
      err = err.copyWith(
          error: data is String
              ? AppException.known(data)
              : AppException.unknown());
      handler.next(err);
    } else {
      err = err.copyWith(error: AppException.unknown());
      handler.next(err);
    }
  }
}
