// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState {
  BlocStatus loginStatus;
  BlocStatus signupStatus;
  AuthState({
    this.loginStatus = const BlocStatus.initial(),
    this.signupStatus = const BlocStatus.initial(),
  });

  AuthState copyWith({
    BlocStatus? loginStatus,
    BlocStatus? signupStatus,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }
}
