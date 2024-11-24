// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationDataModel _$RegistrationDataModelFromJson(
        Map<String, dynamic> json) =>
    RegistrationDataModel(
      RegistrationUserCredentials.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationDataModelToJson(
        RegistrationDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
