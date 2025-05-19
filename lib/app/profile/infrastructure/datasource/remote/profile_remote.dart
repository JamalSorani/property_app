// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🎯 Dart imports:
import 'dart:io';

// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:template_app/app/profile/infrastructure/model/profile_model.dart';
import 'package:template_app/common/constant/src/url.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class ProfileRemote {
  final Dio _dio;
  ProfileRemote({
    required Dio dio,
  }) : _dio = dio;

  Future<ProfileModel> getProfile() async {
    return throwDioException(() async {
      // final response = await _dio.get(AppUrl.getProfile);
      // return ProfileModel.fromMap(response.data);
      await Future.delayed(const Duration(seconds: 3));
      return ProfileModel.fakeData();
    });
  }

  Future<bool> modifyProfile(ProfileModel profileModel) async {
    return throwDioException(() async {
      // await _dio.post(
      //   AppUrl.modifyProfile,
      //   data: profileModel.toMap(),
      // );
      await Future.delayed(const Duration(seconds: 3));
      return true;
    });
  }

  Future<bool> editProfileUsingFormData(ProfileModel profile) {
    return throwDioException(() async {
      Map<String, dynamic> jsonProfile = profile.toMap();
      File file = File(jsonProfile["image"] ?? "");
      if (file.existsSync()) {
        jsonProfile.addAll({"image": await MultipartFile.fromFile(file.path)});
      } else {
        jsonProfile.addAll({"image": null});
      }
      await _dio.post(AppUrl.modifyProfile,
          data: FormData.fromMap(jsonProfile));
      return true;
    });
  }
}
