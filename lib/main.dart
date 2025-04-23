import 'package:festpay_pocket_app/app/app_module.dart';
import 'package:festpay_pocket_app/app/app_widget.dart';
import 'package:festpay_pocket_app/app/config/app_initialization/app_initialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await AppInitialization.initAppConfigurations();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
