part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
class intialEvent extends ProfileEvent{}
class LogoutEvent extends ProfileEvent{}