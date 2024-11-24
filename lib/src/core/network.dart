import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:test_task_balina_soft/src/core/token_interceptors.dart';

class Network {
  static final Network _singleton = Network._internal();
  late Dio dio;

  Network._internal() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://junior.balinasoft.com/api',
      contentType: 'application/json',
    ));
    dio.interceptors.add(TokenInterceptors());
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: false,
      responseHeader: true,
      error: true,
      compact: true,
    ));
  }

  factory Network.singleton() => _singleton;
}
