// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoInfoModel _$PhotoInfoModelFromJson(Map<String, dynamic> json) =>
    PhotoInfoModel(
      name: json['name'] as String,
      path: json['path'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      base64Image: json['base64Image'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$PhotoInfoModelToJson(PhotoInfoModel instance) =>
    <String, dynamic>{
      'base64Image': instance.base64Image,
      'date': instance.date,
      'name': instance.name,
      'path': instance.path,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
