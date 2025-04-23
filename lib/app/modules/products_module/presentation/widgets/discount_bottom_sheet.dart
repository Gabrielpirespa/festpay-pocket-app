import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/core/utils/formatters/percentage_input_formatter.dart';
import 'package:festpay_pocket_app/app/core/widgets/custom_stadium_button.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DiscountBottomSheet extends StatefulWidget {
  const DiscountBottomSheet({super.key});

  @override
  State<DiscountBottomSheet> createState() => _DiscountBottomSheetState();
}

class _DiscountBottomSheetState extends State<DiscountBottomSheet> {
  final formKey = GlobalKey<FormState>();
  late CartBloc _cartBloc;
  final TextEditingController couponTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _cartBloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartBloc,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[24],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: AppTheme.colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 48,
          ),
          child: BlocBuilder<CartBloc, CartState>(
              bloc: _cartBloc,
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Percentual de Desconto',
                        style: AppTheme.textStyles.montserrat600.copyWith(
                          fontSize: 20,
                          color: AppTheme.colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 53,
                      ),
                      BlocBuilder<CartBloc, CartState>(
                          bloc: _cartBloc,
                          builder: (context, state) {
                            return TextFormField(
                              inputFormatters: [
                                PercentageInputFormatter(),
                              ],
                              controller: couponTextEditingController,
                              onChanged: (value) => _cartBloc
                                  .add(InsertCouponEvent(couponValue: value)),
                              validator: (_) => state.isCouponValid
                                  ? null
                                  : 'Informe um valor entre 1 e 100',
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppTheme.colors.primaryColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppTheme.colors.primaryColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppTheme.colors.red,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppTheme.colors.red,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: 18,
                                  left: 20,
                                  right: 20,
                                  bottom: 60,
                                ),
                                hintText: 'Ex.: 20%',
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 36,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomStadiumButton(
                          text: 'Concluir',
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              Modular.to.pop();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
