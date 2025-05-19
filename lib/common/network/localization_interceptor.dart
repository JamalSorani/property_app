// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import '../constant/keys.dart';
import '../injection/injection.dart';

class LocalizationInterceptor extends Interceptor {
  LocalizationInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      'lang': getIt<SharedPreferences>().getString(kLanguage) ?? 'ar',
      "X-TimeZoneId": await FlutterTimezone.getLocalTimezone(),
    });
    handler.next(options);
  }
}
