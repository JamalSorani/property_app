// 📦 Package imports:
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:draggable_float_widget/draggable_float_widget.dart';

// 🌎 Project imports:
import '../imports/imports.dart';
import '../injection/injection.dart';

class RequestInspect extends StatefulWidget {
  const RequestInspect({
    super.key,
    required this.child,
    this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  State<RequestInspect> createState() => _RequestInspectState();
}

class _RequestInspectState extends State<RequestInspect> {
  @override
  void initState() {
    super.initState();
    getIt.registerSingleton<Alice>(
      Alice(
        showNotification: false,
        showInspectorOnShake: true,
        maxCallsCount: 1000,
        navigatorKey: widget.navigatorKey,
        notificationIcon: "@mipmap/ic_launcher",
      ),
    );
    getIt<Dio>().interceptors.add(getIt<Alice>().getDioInterceptor());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) {
                return Stack(
                  children: [
                    widget.child,
                    DraggableFloatWidget(
                      config: const DraggableFloatWidgetBaseConfig(
                        isFullScreen: false,
                        initPositionYInTop: false,
                        initPositionYMarginBorder: 50,
                      ),
                      child: FloatingActionButton(
                        child: const Icon(Icons.construction_outlined),
                        onPressed: () {
                          getIt<Alice>().showInspector();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
