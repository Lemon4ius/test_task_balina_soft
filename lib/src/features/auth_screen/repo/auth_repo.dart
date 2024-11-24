import '../../../core/models/registration_model.dart';

abstract class AuthRepo{
  Future<dynamic> onLogin(RegistrationModel registrationModel);
}