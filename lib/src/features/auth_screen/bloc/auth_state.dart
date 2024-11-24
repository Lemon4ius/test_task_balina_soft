part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoggedState extends AuthState {
  final RegistrationUserCredentials userData;

  AuthLoggedState(this.userData);
}

final class AuthErrorState extends AuthState{
  final String message;

  AuthErrorState(this.message);
}