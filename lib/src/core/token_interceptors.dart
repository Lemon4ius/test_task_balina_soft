import 'package:dio/dio.dart';
import 'package:test_task_balina_soft/src/core/constans.dart';

import 'data_store.dart';

class TokenInterceptors extends Interceptor{
  final BaseDataStore baseDataStore = BaseDataStore();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = baseDataStore.getString(ConstantsShared.accessTokenKey);
    if (accessToken.isNotEmpty) {
      options.headers.addAll({'Access-Token': accessToken});
    }
    return handler.next(options);
  }
}