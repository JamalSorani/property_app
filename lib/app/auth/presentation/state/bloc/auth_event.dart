part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {}
