// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import '../../infrastructure/model/notification.dart';

abstract class NotificationRepo {
  Future<Either<String, List<NotificationModel>>> getAllNotification();
}
