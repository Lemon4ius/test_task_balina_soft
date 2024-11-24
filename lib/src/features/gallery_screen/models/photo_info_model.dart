import 'package:json_annotation/json_annotation.dart';

part 'photo_info_model.g.dart';

@JsonSerializable()
class PhotoInfoModel {
  final String? base64Image;
  final String? date;
  final String name;
  final String path;
  final double longitude;
  final double latitude;

  PhotoInfoModel({
    required this.name,
    required this.path,
    required this.longitude,
    required this.latitude,
    this.base64Image,
    this.date,
  });

  Map<String, dynamic> toJson() => _$PhotoInfoModelToJson(this);

  factory PhotoInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoInfoModelFromJson(json);
}
