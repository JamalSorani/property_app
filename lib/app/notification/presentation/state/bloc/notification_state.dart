// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

class NotificationState {
  Result<List<NotificationModel>> notifications;
  NotificationState({
    this.notifications = const Result.init(),
  });

  NotificationState copyWith({
    Result<List<NotificationModel>>? notifications,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }
}
