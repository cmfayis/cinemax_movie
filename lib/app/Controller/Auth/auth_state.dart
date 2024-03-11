part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class SignUpPageState extends AuthState{}
class ForgotPasswordState extends AuthState{}
class SignUpState extends AuthState{}