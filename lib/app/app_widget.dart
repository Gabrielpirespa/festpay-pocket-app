import 'package:festpay_pocket_app/app/config/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/products');

    return MaterialApp.router(
      title: 'Festpay',
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      theme: AppThemeData.primaryTheme(),
    );
  }
}
