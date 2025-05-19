// 📦 Package imports:
import 'package:catcher_2/catcher_2.dart';
import 'package:device_preview/device_preview.dart';

// 🌎 Project imports:
import 'common/imports/imports.dart';
import 'common/injection/injection.dart';

bootstrap(Widget mainApp) async {
  Catcher2Options releaseOptions = Catcher2Options(
    SilentReportMode(),
    [
      DiscordHandler("",
          enableApplicationParameters: true,
          enableCustomParameters: true,
          enableDeviceParameters: true,
          enableStackTrace: true)
    ],
  );

  WidgetsFlutterBinding.ensureInitialized();

  try {
    await initInjection();
  } finally {
    if (kReleaseMode) {
      Catcher2(
        runAppFunction: () => mainApp,
        releaseConfig: releaseOptions,
        enableLogger: true,
      );
      runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => mainApp, // Wrap your app
        ),
      );
    } else {
      runApp(
        DevicePreview(
          enabled: false,
          builder: (context) => mainApp, // Wrap your app
        ),
      );
    }
  }
}
