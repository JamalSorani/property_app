// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';

// 🌎 Project imports:
import 'package:template_app/app/auth/presentation/state/provider/counter_provider.dart';
import 'package:template_app/common/widget/request_inspect.dart';
import '../common/config/theme.dart';
import '../common/helper/localization_service.dart';
import '../common/imports/imports.dart';
import '../common/injection/injection.dart';
import '../common/states/app_manager_bloc/app_manager_bloc.dart';
import '../router/router_config.dart';
import 'auth/domain/repo/auth_repo.dart';
import 'onBaording/presentation/state/page_index_provider.dart';
import 'root/presentation/state/provider/nav_bar_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final BRouterConfig router;
  late final AppManagerBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AppManagerBloc(
      doBeforeOpen: _doBeforeOpen,
      lazyAuthRepository: () => getIt<AuthRepository>(),
      context: context,
    )..add(AppManagerStarted());
    router = BRouterConfig(appManagerBloc: _bloc);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            BlocProvider.value(value: _bloc),
            ChangeNotifierProvider(create: (context) => NavBarProvider()),
            ChangeNotifierProvider(create: (context) => PageIndexProvider()),
            ChangeNotifierProvider(
                create: (context) => getIt<CountdownProvider>()),
          ],
          child: BeamerProvider(
            routerDelegate: router.router,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: router.router,
              theme: AppThemes.lightThemeData,
              routeInformationParser: BeamerParser(),
              builder: (context, child) {
                child = BotToastInit()(context, child);
                if (kReleaseMode) {
                  child = RequestInspect(
                    navigatorKey: router.router.navigatorKey,
                    child: child,
                  );
                } else {
                  if (!getIt.isRegistered<LocalizationService>()) {
                    getIt.registerSingleton<LocalizationService>(
                      LocalizationService(context),
                    );
                  }
                  child = DevicePreview.appBuilder(context, child);
                }
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: child,
                );
              },
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _doBeforeOpen() async {
    final Completer<void> completer = Completer();
    try {
      if (!completer.isCompleted) {
        completer.complete();
      }
    } catch (e) {
      completer.complete();
    }
    return completer.future;
  }
}
