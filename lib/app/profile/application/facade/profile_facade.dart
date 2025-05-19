// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/profile/domain/profile_repo/profile_repo.dart';
import 'package:template_app/app/profile/infrastructure/model/profile_model.dart';

class ProfileFacade {
  final ProfileRepo _remote;
  ProfileFacade({
    required ProfileRepo remote,
  }) : _remote = remote;

  Future<Either<String, ProfileModel>> getProfile() async =>
      await _remote.getProfile();
}
