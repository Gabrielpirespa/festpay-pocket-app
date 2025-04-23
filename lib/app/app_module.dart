import 'package:dio/dio.dart';
import 'package:festpay_pocket_app/app/core/services/network_checker/network_checker_service.dart';
import 'package:festpay_pocket_app/app/core/services/network_checker/network_cheker_service_impl.dart';
import 'package:festpay_pocket_app/app/core/services/rest_client/dio_rest_client.dart';
import 'package:festpay_pocket_app/app/core/services/rest_client/rest_client_service.dart';
import 'package:festpay_pocket_app/app/modules/products_module/products_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    // DIO
    i.addInstance<Dio>(DioRestClient.dio());
    i.addLazySingleton<RestClientService>(DioRestClient.new);

    //Connectivity Checker
    i.addInstance(InternetConnectionChecker());
    i.addLazySingleton<NetworkCheckerService>(NetworkChekerServiceImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      '/home',
      module: ProductsModule(),
    );
  }
}
