import 'package:dio/dio.dart';
import 'package:festpay_pocket_app/app/config/app_initialization/environment/environment_manager.dart';
import 'package:festpay_pocket_app/app/core/services/rest_client/rest_client_service.dart';

class DioRestClient implements RestClientService {
  static int get _timeout => 60;

  static Dio dio() => Dio(
        BaseOptions(
          baseUrl: EnvironmentVariables.baseUrl,
          connectTimeout: Duration(seconds: _timeout),
          receiveTimeout: Duration(seconds: _timeout),
          sendTimeout: Duration(seconds: _timeout),
        ),
      );

  @override
  Future get({required String url}) async {
    return await dio().get(url);
  }
}
