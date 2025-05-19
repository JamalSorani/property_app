// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../core/result_builder/result_builder.dart';
import '../../../../../router/router_config.dart';
import '../../state/bloc/notification_bloc.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static const pagePath = 'notification';
  static BeamerBuilder pageBuilder = (context, state, data) {
    return const NotificationScreen();
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<NotificationBloc>()..add(GetAllNotification()),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('الإشعارات'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ResultBuilder(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        onError: () => const SizedBox(),
                        result: state.notifications,
                        success: (data) => ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => NotificationItem(
                            title: data[index].title,
                            body: data[index].description,
                            dateCreated: data[index].date,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
