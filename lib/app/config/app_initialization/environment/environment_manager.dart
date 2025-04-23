// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentManager {
  static Future<void> initializeEnvironment() async {
    await dotenv.load(fileName: ".env");
  }
}

class EnvironmentVariables {
  static String _envVariable(String name) => dotenv.env[name] ?? '';

  static String get baseUrl => _envVariable('BASE_URL');
}
