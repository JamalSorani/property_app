part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfile extends ProfileEvent {}

class SaveProfile extends ProfileEvent {}
