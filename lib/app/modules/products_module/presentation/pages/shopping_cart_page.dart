import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/core/widgets/custom_stadium_button.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/cart_card.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/discount_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  late CartBloc _cartBloc;
  @override
  void initState() {
    super.initState();
    _cartBloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      bloc: _cartBloc,
      listener: (context, state) {
        if (state.status == CartStatus.success) {
          Modular.to.pushNamed('success');
        }
        if (state.status == CartStatus.error) {
          Modular.to.pushNamed('error');
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
          bloc: _cartBloc,
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                    top: 48.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 18,
                            ),
                            onTap: () {
                              Modular.to.pop();
                            },
                          ),
                          const Spacer(),
                          Text(
                            'Carrinho',
                            style: AppTheme.textStyles.montserrat600.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const DiscountBottomSheet();
                                  });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.colors.purple,
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: Text(
                                '%',
                                style:
                                    AppTheme.textStyles.montserrat600.copyWith(
                                  fontSize: 17,
                                  color: AppTheme.colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 81,
                      ),
                      Expanded(
                        child: BlocBuilder<CartBloc, CartState>(
                            bloc: _cartBloc,
                            builder: (context, state) {
                              final cartProducts = state.selectedCartProducts;

                              return ListView.builder(
                                  itemCount: cartProducts.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: CartCard(
                                        cartProduct: cartProducts[index],
                                      ),
                                    );
                                  });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              bottomSheet: Container(
                decoration: BoxDecoration(
                    boxShadow: kElevationToShadow[24],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: AppTheme.colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Valor',
                                style:
                                    AppTheme.textStyles.montserrat700.copyWith(
                                  fontSize: 17,
                                  color: AppTheme.colors.purple,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Descontos',
                                style:
                                    AppTheme.textStyles.montserrat700.copyWith(
                                  fontSize: 17,
                                  color: AppTheme.colors.purple,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Valor Total',
                                style:
                                    AppTheme.textStyles.montserrat700.copyWith(
                                  fontSize: 17,
                                  color: AppTheme.colors.purple,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BlocBuilder<CartBloc, CartState>(
                                  bloc: _cartBloc,
                                  builder: (context, state) {
                                    return Text(
                                      state.totalAmountFormatted,
                                      style: AppTheme.textStyles.montserrat600
                                          .copyWith(
                                        fontSize: 15,
                                        color: AppTheme.colors.black,
                                      ),
                                    );
                                  }),
                              const SizedBox(
                                height: 12,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                  bloc: _cartBloc,
                                  builder: (context, state) {
                                    return Text(
                                      state.couponPercentageValue,
                                      style: AppTheme.textStyles.montserrat600
                                          .copyWith(
                                        fontSize: 15,
                                        color: AppTheme.colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    );
                                  }),
                              const SizedBox(
                                height: 30,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                  bloc: _cartBloc,
                                  builder: (context, state) {
                                    return Text(
                                      state.paymentAmountFormatted,
                                      style: AppTheme.textStyles.montserrat600
                                          .copyWith(
                                        fontSize: 15,
                                        color: AppTheme.colors.black,
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomStadiumButton(
                          text: 'Finalizar Pedido',
                          onPressed: () {
                            _cartBloc.add(FinalizePurchaseEvent());
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
