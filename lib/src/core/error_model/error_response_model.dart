import 'package:json_annotation/json_annotation.dart';
part 'error_response_model.g.dart';
@JsonSerializable()
class ErrorResponseModel {
  final int status;
  @JsonKey(name: 'error')
  final String message;

  ErrorResponseModel(this.status, this.message);

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => _$ErrorResponseModelFromJson(json);
}
