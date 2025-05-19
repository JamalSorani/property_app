// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../../../../router/router_config.dart';
import '../../../../notification/presentation/ui/screen/notification_screen.dart';
import '../../state/provider/nav_bar_provider.dart';
import '../widget/root_navbar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static const String pagePath = '/root';

  static BeamerBuilder pageBuilder = (context, state, data) {
    return const RootScreen();
  };

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.blue,
          centerTitle: true,
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                context.beamToNamed(NotificationScreen.pagePath);
              },
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: context.read<NavBarProvider>().pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const RootNavbar(),
    );
  }
}
