// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import '../../../app/notification/application/facade/notification_facade.dart';
import '../../../app/notification/domain/notification_repo/notification_repo.dart';
import '../../../app/notification/infrastructure/datasource/remote/notification_remote.dart';
import '../../../app/notification/infrastructure/repo_impl/notification_repo_impl.dart';
import '../../../app/notification/presentation/state/bloc/notification_bloc.dart';
import '../injection.dart';

notificationInjection() {
  getIt.registerSingleton<NotificationRemote>(
    NotificationRemote(
      getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<NotificationRepo>(
    NotificationRepoImpl(
      remote: getIt<NotificationRemote>(),
    ),
  );

  getIt.registerSingleton<NotificationFacade>(
    NotificationFacade(
      remote: getIt<NotificationRepo>(),
    ),
  );

  getIt.registerFactory<NotificationBloc>(
      () => NotificationBloc(facade: getIt<NotificationFacade>()));
}
