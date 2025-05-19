// ignore_for_file: deprecated_member_use

// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:dio_refresh_bot/dio_refresh_bot.dart';

// 🌎 Project imports:
import 'package:template_app/app/onBaording/presentation/ui/screens/onboarding_screen.dart';
import '../app/auth/presentation/ui/screen/login_screen.dart';
import '../app/auth/presentation/ui/screen/signup_screen.dart';
import '../app/contact_us/presentation/ui/screen/contact_us.dart';
import '../app/notification/presentation/ui/screen/notification_screen.dart';
import '../app/profile/presentation/ui/screen/profile_screen.dart';
import '../app/root/presentation/ui/screen/root_screen.dart';
import '../common/helper/colored_print.dart';
import '../common/imports/imports.dart';
import '../common/states/app_manager_bloc/app_manager_bloc.dart';
import '../common/widget/splash.dart';

typedef BeamerBuilder = dynamic Function(BuildContext, BeamState, Object?);

class RefreshStream extends ChangeNotifier {
  RefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class BRouterConfig {
  late final AppManagerBloc appManagerBloc;
  late final BeamerDelegate router;

  BRouterConfig({required this.appManagerBloc}) {
    router = BeamerDelegate(
      // initialPath: SplashScreen.pagePath,
      initialPath: LoginScreen.pagePath,
      updateListenable: RefreshStream(appManagerBloc.stream),
      navigatorObservers: [BotToastNavigatorObserver()],
      routeListener: (routerInfo, routerDelegate) {
        printG("route: ${routerInfo.location}");
        printC(appManagerBloc.state.status);
        if (appManagerBloc.state.status == Status.unauthenticated &&
            !routerInfo.location.contains(OnBoardingScreen.pagePath)) {
          printG(Status.unauthenticated);
          routerDelegate.beamToNamed(OnBoardingScreen.pagePath);
        } else if (appManagerBloc.state.status == Status.authenticated &&
            !routerInfo.location.contains(RootScreen.pagePath)) {
          return routerDelegate.beamToNamed(RootScreen.pagePath);
        }
      },
      locationBuilder: RoutesLocationBuilder(
        routes: {
          SplashScreen.pagePath: SplashScreen.pageBuilder,
          '/onbording': OnBoardingScreen.pageBuilder,

          '/onbording/login': LoginScreen.pageBuilder,
          '/onbording/login/signup': SignUp.pageBuilder,
          '/root': RootScreen.pageBuilder,
          // '/root/about-app-screen': AboutAppScreen.pageBuilder,
          '/root/notification': NotificationScreen.pageBuilder,
          '/root/profile': ProfileScreen.pageBuilder,
          '/root/contactUs': ContactUs.pageBuilder,
        },
      ).call,
    );
  }
}
