// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import '../../infrastructure/model/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<String, ProfileModel>> getProfile();
  Future<Either<String, bool>> modifyProfile(ProfileModel profileModel);
}
