// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_user_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationUserCredentials _$RegistrationUserCredentialsFromJson(
        Map<String, dynamic> json) =>
    RegistrationUserCredentials(
      (json['userId'] as num).toInt(),
      json['login'] as String,
      json['token'] as String,
    );

Map<String, dynamic> _$RegistrationUserCredentialsToJson(
        RegistrationUserCredentials instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'login': instance.login,
      'token': instance.token,
    };
