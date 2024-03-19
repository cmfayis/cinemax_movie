part of 'profile_bloc.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}

class FetchState extends SettingState {
  final String name;

  final String email;

  FetchState({
    required this.email,
    required this.name,
  });
}
class LogoutState extends SettingState {}
