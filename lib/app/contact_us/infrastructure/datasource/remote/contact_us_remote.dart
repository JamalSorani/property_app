// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:template_app/common/constant/src/url.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class ContactUsRemote {
  final Dio _dio;
  ContactUsRemote({
    required Dio dio,
  }) : _dio = dio;

  Future<bool> contactPost(String title, String body) async {
    return throwDioException<bool>(() async {
      final Response response = await _dio
          .post(AppUrl.contactUs, data: {"title": title, "content": body});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    });
  }
}
