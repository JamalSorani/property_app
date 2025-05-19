// 📦 Package imports:
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'src/auth_injection.dart';
import 'src/contact_us.dart';
import 'src/general_injection.dart';
import 'src/notification_injection.dart';
import 'src/profile_injection.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjection() async {
  await generalInjection();
  await authInjection();
  notificationInjection();
  profileInjection();
  contactUs();
}
