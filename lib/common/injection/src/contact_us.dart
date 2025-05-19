// 📦 Package imports:
import 'package:dio/dio.dart';

// 🌎 Project imports:
import '../../../app/contact_us/application/facade/contact_us_facade.dart';
import '../../../app/contact_us/domain/contact_us_repo/contact_us_repo.dart';
import '../../../app/contact_us/infrastructure/contact_us_repo_impl/contact_us_repo_impl.dart';
import '../../../app/contact_us/infrastructure/datasource/remote/contact_us_remote.dart';
import '../../../app/contact_us/presentation/bloc/contact_us_bloc.dart';
import '../injection.dart';

contactUs() {
  getIt.registerSingleton<ContactUsRemote>(
    ContactUsRemote(
      dio: getIt<Dio>(),
    ),
  );

  getIt.registerSingleton<ContactUsRepo>(
    ContactUsRepoImpl(
      remote: getIt<ContactUsRemote>(),
    ),
  );

  getIt.registerSingleton<ContactUsFacade>(
    ContactUsFacade(
      remote: getIt<ContactUsRepo>(),
    ),
  );

  getIt.registerFactory<ContactUsBloc>(
    () => ContactUsBloc(
      facade: getIt<ContactUsFacade>(),
    ),
  );
}
