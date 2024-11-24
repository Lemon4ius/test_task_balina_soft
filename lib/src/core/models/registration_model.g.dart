// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) =>
    RegistrationModel(
      json['login'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegistrationModelToJson(RegistrationModel instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };
