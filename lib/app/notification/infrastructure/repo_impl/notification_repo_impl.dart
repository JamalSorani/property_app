// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/notification/domain/notification_repo/notification_repo.dart';
import 'package:template_app/app/notification/infrastructure/datasource/remote/notification_remote.dart';
import 'package:template_app/app/notification/infrastructure/model/notification.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationRemote _remote;
  NotificationRepoImpl({
    required NotificationRemote remote,
  }) : _remote = remote;

  @override
  Future<Either<String, List<NotificationModel>>> getAllNotification() {
    return throwAppException(() async {
      final response = await _remote.getAllNotification();
      return response;
    });
  }
}
