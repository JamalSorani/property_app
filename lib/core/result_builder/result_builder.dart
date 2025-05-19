// ignore_for_file: must_be_immutable

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '../../common/state/loading_progress.dart';
import '../../common/widget/failed_widget.dart';
import 'result.dart';

class ResultBuilder<T> extends StatelessWidget {
  ResultBuilder({
    super.key,
    required this.success,
    this.loading,
    required this.onError,
    required this.result,
  });

  final Result<T> result;
  Widget Function()? loading;
  final Widget Function(T data) success;
  final Function() onError;

  @override
  Widget build(BuildContext context) {
    late final Widget next;

    loading ??= () => const LoadingProgress();

    result.when(
      init: () => next = const SizedBox(),
      loading: () => next = loading!(),
      loaded: (data) => next = success(data),
      error: (message) => next = FailedWidget(
        error: message,
        onPressed: onError,
      ),
    );
    return next;
  }
}
