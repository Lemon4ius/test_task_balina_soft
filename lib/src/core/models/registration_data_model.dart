import 'package:json_annotation/json_annotation.dart';
import 'package:test_task_balina_soft/src/core/models/registration_user_credentials.dart';
part 'registration_data_model.g.dart';

@JsonSerializable()
class RegistrationDataModel{
  final RegistrationUserCredentials data;

  RegistrationDataModel(this.data);

  factory RegistrationDataModel.fromJson(Map<String, dynamic> json) => _$RegistrationDataModelFromJson(json);
}