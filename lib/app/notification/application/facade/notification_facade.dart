// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/notification/domain/notification_repo/notification_repo.dart';
import 'package:template_app/app/notification/infrastructure/model/notification.dart';

class NotificationFacade {
  final NotificationRepo _remote;
  NotificationFacade({
    required NotificationRepo remote,
  }) : _remote = remote;

  Future<Either<String, List<NotificationModel>>> getAllNotification() =>
      _remote.getAllNotification();
}
