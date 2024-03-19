part of 'profile_bloc.dart';

@immutable
sealed class SettingEvent {}
class intialEvent extends SettingEvent{}
class LogoutEvent extends SettingEvent{}
