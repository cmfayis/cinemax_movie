part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


class FetchState extends ProfileState {
  final String name;

  final String email;

  FetchState({
    required this.email,
    required this.name,
  });
}
class LogoutState extends ProfileState {}
