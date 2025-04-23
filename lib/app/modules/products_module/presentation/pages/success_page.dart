import 'package:festpay_pocket_app/app/config/themes/app_icons.dart';
import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/core/widgets/custom_stadium_button.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.colors.purple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(AppIcons.festpayImage),
              SizedBox(
                height: mediaQuery.height / 6,
              ),
              Card(
                elevation: 16,
                shadowColor: AppTheme.colors.pink,
                color: AppTheme.colors.transparent,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(AppIcons.successImage),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                'Transação concluída com sucesso',
                style: AppTheme.textStyles.montserrat700.copyWith(
                  fontSize: 30,
                  color: AppTheme.colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: mediaQuery.height / 8,
              ),
              CustomStadiumButton(
                text: 'Fazer um novo pedido',
                backgroundColor: AppTheme.colors.black,
                onPressed: () {
                  Modular.get<CartBloc>().add(ClearCartEvent());
                  Modular.to.popAndPushNamed('products');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
