// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import '../../../app/profile/application/facade/profile_facade.dart';
import '../../../app/profile/domain/profile_repo/profile_repo.dart';
import '../../../app/profile/infrastructure/datasource/remote/profile_remote.dart';
import '../../../app/profile/infrastructure/repo_impl/repo_impl.dart';
import '../../../app/profile/presentation/state/bloc/profile_bloc.dart';
import '../injection.dart';

profileInjection() {
  getIt.registerSingleton<ProfileRemote>(
    ProfileRemote(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(
      remote: getIt<ProfileRemote>(),
    ),
  );

  getIt.registerSingleton<ProfileFacade>(
    ProfileFacade(
      remote: getIt<ProfileRepo>(),
    ),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      facade: getIt<ProfileFacade>(),
    ),
  );
}
