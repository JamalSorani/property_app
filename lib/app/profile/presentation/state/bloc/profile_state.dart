// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {
  BlocStatus status;
  ProfileState({
    this.status = const BlocStatus.initial(),
  });

  ProfileState copyWith({
    BlocStatus? status,
  }) {
    return ProfileState(
      status: status ?? this.status,
    );
  }
}
