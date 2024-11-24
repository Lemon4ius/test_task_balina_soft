part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationSuccessState extends RegistrationState{
  final RegistrationUserCredentials userData;

  RegistrationSuccessState(this.userData);
}

final class RegistrationErrorState extends RegistrationState{
  final String message;

  RegistrationErrorState(this.message);
}
