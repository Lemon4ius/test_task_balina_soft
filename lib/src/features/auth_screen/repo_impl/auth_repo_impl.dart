import 'package:dio/dio.dart';
import 'package:test_task_balina_soft/src/features/auth_screen/repo/auth_repo.dart';

import '../../../core/constans.dart';
import '../../../core/data_store.dart';
import '../../../core/error_model/error_response_model.dart';
import '../../../core/models/registration_data_model.dart';
import '../../../core/models/registration_model.dart';
import '../../../core/network.dart';

class AuthRepoImpl implements AuthRepo {
  final network = Network.singleton();
  final baseDataStore = BaseDataStore();

  @override
  Future<dynamic> onLogin(RegistrationModel registrationModel) async {
    try {
      final response = await network.dio.post(
        '/account/signin',
        data: {
          'login': registrationModel.login,
          'password': registrationModel.password
        },
      );
      final data = RegistrationDataModel.fromJson(response.data);
      baseDataStore.saveString(ConstantsShared.accessTokenKey,data.data.token);
      baseDataStore.saveString(ConstantsShared.userLogin, data.data.login);
      baseDataStore.saveBool(ConstantsShared.alreadyLogin,true);
      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = ErrorResponseModel.fromJson(e.response?.data);
        return errorData;
      }
    }
  }
}
