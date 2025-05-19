// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import '../../../../../core/result_builder/result.dart';
import '../../../application/facade/notification_facade.dart';
import '../../../infrastructure/model/notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationFacade _facade;

  NotificationBloc({required NotificationFacade facade})
      : _facade = facade,
        super(NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetAllNotification) {
        await getAllNotification(event, emit);
      }
    });
  }

  getAllNotification(
      GetAllNotification event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(notifications: const Result.loading()));
    final result = await _facade.getAllNotification();
    result.fold(
      (left) => emit(state.copyWith(notifications: Result.error(error: left))),
      (right) =>
          emit(state.copyWith(notifications: Result.loaded(data: right))),
    );
  }
}
