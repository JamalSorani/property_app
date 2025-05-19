// ignore_for_file: deprecated_member_use

// 🎯 Dart imports:
import 'dart:async';
import 'dart:developer';

// 📦 Package imports:
import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'app_exception.dart';

Future<Either<String, U>> throwAppException<U>(FutureOr Function() call) async {
  try {
    return Right(await call());
  } on AppException catch (e) {
    return Left(e.message);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}

Future<T> throwDioException<T>(FutureOr<T> Function() call) async {
  try {
    return await call();
  } on DioError catch (e) {
    throw e.error ?? AppException.unknown();
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    throw AppException.unknown();
  }
}
