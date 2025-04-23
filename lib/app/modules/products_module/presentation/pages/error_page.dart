import 'package:festpay_pocket_app/app/config/themes/app_icons.dart';
import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/core/widgets/custom_stadium_button.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.red,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppIcons.festpayImage),
              Text(
                'Transação não concluída, verifique seu saldo',
                style: AppTheme.textStyles.montserrat700.copyWith(
                  fontSize: 30,
                  color: AppTheme.colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              CustomStadiumButton(
                text: 'Voltar ao pedido',
                style: AppTheme.textStyles.montserrat600.copyWith(
                  fontSize: 17,
                  color: AppTheme.colors.red,
                ),
                backgroundColor: AppTheme.colors.white,
                onPressed: () {
                  Modular.get<CartBloc>().add(ResetStatusEvent());
                  Modular.to.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
