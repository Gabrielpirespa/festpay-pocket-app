import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ProductTypesTab extends StatelessWidget {
  const ProductTypesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: TabBar(
        indicatorColor: AppTheme.colors.primaryColor,
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        dividerColor: AppTheme.colors.transparent,
        unselectedLabelColor: AppTheme.colors.gray,
        labelColor: AppTheme.colors.primaryColor,
        labelStyle: AppTheme.textStyles.montserrat400.copyWith(fontSize: 17),
        isScrollable: true,
        tabs: const [
          Tab(child: Text('Todos')),
          Tab(child: Text('Bebidas')),
          Tab(child: Text('Salgados')),
          Tab(child: Text('Saúde')),
          Tab(child: Text('Doces'))
        ],
      ),
    );
  }
}
