part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class OnRegistrationEvent extends RegistrationEvent{
    final RegistrationModel _registrationModel;

    OnRegistrationEvent(this._registrationModel);
}


