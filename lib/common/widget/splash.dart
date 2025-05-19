// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../router/router_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const pagePath = '/splash';

  static BeamerBuilder pageBuilder = (context, state, data) {
    return const SplashScreen();
  };

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
