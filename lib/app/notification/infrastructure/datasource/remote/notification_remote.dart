// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field

// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:template_app/app/notification/infrastructure/model/notification.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class NotificationRemote {
  final Dio _dio;
  NotificationRemote(Dio dio) : _dio = dio;

  Future<List<NotificationModel>> getAllNotification() async {
    return throwDioException(() async {
      // final response = await _dio.get(AppUrl.getAllNotification);
      await Future.delayed(const Duration(seconds: 3));
      return NotificationModel.fakeData;
      // return (response.data as List).map((e) => NotificationModel.fromMap(e)).toList();
    });
  }
}
