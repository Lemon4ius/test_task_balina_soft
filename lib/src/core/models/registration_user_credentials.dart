import 'package:json_annotation/json_annotation.dart';

part 'registration_user_credentials.g.dart';

@JsonSerializable()
class RegistrationUserCredentials {
  final int userId;
  final String login;
  final String token;

  RegistrationUserCredentials(this.userId, this.login, this.token);

  factory RegistrationUserCredentials.fromJson(Map<String, dynamic> json) =>
      _$RegistrationUserCredentialsFromJson(json);
}
