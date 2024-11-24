
import '../../../core/models/registration_model.dart';


abstract class RegistrationRepo{
  Future<dynamic> sendRegistrationData(RegistrationModel registrationModel);
}