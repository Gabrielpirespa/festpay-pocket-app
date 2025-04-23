import 'package:festpay_pocket_app/app/config/app_initialization/environment/environment_manager.dart';
import 'package:flutter/material.dart';

class AppInitialization {
  static Future<void> initAppConfigurations() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EnvironmentManager.initializeEnvironment();
  }
}
