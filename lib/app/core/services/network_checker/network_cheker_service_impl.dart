import 'package:festpay_pocket_app/app/core/services/network_checker/network_checker_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChekerServiceImpl implements NetworkCheckerService {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkChekerServiceImpl(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
