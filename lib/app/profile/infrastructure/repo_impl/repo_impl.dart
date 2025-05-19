// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/profile/domain/profile_repo/profile_repo.dart';
import 'package:template_app/app/profile/infrastructure/datasource/remote/profile_remote.dart';
import 'package:template_app/app/profile/infrastructure/model/profile_model.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemote _remote;
  ProfileRepoImpl({
    required ProfileRemote remote,
  }) : _remote = remote;

  @override
  Future<Either<String, ProfileModel>> getProfile() {
    return throwAppException(() async {
      final response = await _remote.getProfile();
      return response;
    });
  }

  @override
  Future<Either<String, bool>> modifyProfile(ProfileModel profileModel) {
    return throwAppException(() async {
      final response = await _remote.modifyProfile(profileModel);
      return response;
    });
  }
}
