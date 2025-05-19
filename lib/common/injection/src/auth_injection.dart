// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import 'package:template_app/common/utils/storage_service/storage_service.dart';
import '../../../app/auth/application/facade/auth_facade.dart';
import '../../../app/auth/domain/repo/auth_repo.dart';
import '../../../app/auth/infrastructure/data_source/local/auth_local.dart';
import '../../../app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import '../../../app/auth/infrastructure/data_source/remote/auth_remote.dart';
import '../../../app/auth/infrastructure/repo_imp/repo_imp.dart';
import '../../../app/auth/presentation/state/bloc/auth_bloc.dart';
import '../injection.dart';

Future<void> authInjection() async {
  getIt.registerSingleton<AuthLocal>(
      AuthLocal(local: getIt<StorageService<SharedStorage>>()));

  getIt.registerSingleton<AuthRemote>(AuthRemote(getIt<Dio>()));

  getIt.registerSingleton<AuthRepository>(AuthRepoImp(
    remote: getIt<AuthRemote>(),
    reactiveTokenStorage: getIt<ReactiveTokenStorage>(),
    storageService: getIt<AuthLocal>(),
  ));

  getIt.registerSingleton<AuthFacade>(
    AuthFacade(
      remote: getIt<AuthRepository>(),
    ),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      facade: getIt<AuthFacade>(),
    ),
  );
}
