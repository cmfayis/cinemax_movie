part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class ForgotPasswordEvent extends AuthEvent {}
class CheckLoginStatusEvent extends AuthEvent {}
class SignUpPageEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final name;
  final email;
  final password;
  SignUpEvent(
      {required this.name, required this.email, required this.password});
}

class LoginEvent extends AuthEvent {
  final email;
  final password;
  LoginEvent({required this.email, required this.password});
}
