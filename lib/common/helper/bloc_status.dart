// ignore_for_file: unused_field, library_private_types_in_public_api

// 🎯 Dart imports:
import 'dart:core';

enum _Status { initial, loading, success, fail, none }

class BlocStatus {
  final _Status status;
  final String? error;

  const BlocStatus.loading()
      : status = _Status.loading,
        error = null;

  const BlocStatus.success()
      : status = _Status.success,
        error = null;

  const BlocStatus.fail({required this.error}) : status = _Status.fail;

  const BlocStatus.initial()
      : status = _Status.initial,
        error = null;

  bool isLoading() => status == _Status.loading;

  bool isInitial() => status == _Status.initial;

  bool isFail() => status == _Status.fail;

  bool isSuccess() => status == _Status.success;
}
