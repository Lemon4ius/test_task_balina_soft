// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) =>
    ErrorResponseModel(
      (json['status'] as num).toInt(),
      json['error'] as String,
    );

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.message,
    };
