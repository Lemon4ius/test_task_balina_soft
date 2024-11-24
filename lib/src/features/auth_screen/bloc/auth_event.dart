part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class OnLoginAuthEvent extends AuthEvent{
  final RegistrationModel _registrationModel;

  OnLoginAuthEvent(this._registrationModel);
}
