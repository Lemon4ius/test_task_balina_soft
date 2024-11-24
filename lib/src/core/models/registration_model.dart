
import 'package:json_annotation/json_annotation.dart';

part 'registration_model.g.dart';

@JsonSerializable()
class RegistrationModel {
  final String login;
  final String password;

  RegistrationModel(this.login, this.password,);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);

  RegistrationModel copyWith({
    required final String login,
    required final String password,
    required final String repeatPassword,
  }) {
    return RegistrationModel(login, password,);
  }
}
