import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddAndRemoveWidget extends StatefulWidget {
  final ProductEntity product;
  final EdgeInsetsGeometry? padding;
  final double? spacing;
  const AddAndRemoveWidget(
      {super.key, required this.product, this.padding, this.spacing});

  @override
  State<AddAndRemoveWidget> createState() => _AddAndRemoveWidgetState();
}

class _AddAndRemoveWidgetState extends State<AddAndRemoveWidget> {
  late CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _cartBloc = Modular.get<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.colors.primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 2.0),
        child: BlocBuilder<CartBloc, CartState>(
            bloc: _cartBloc,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _cartBloc.add(RemoveProductEvent(
                          title: widget.product.title ?? ''));
                    },
                    child: Text(
                      '-',
                      style: AppTheme.textStyles.montserrat600.copyWith(
                        fontSize: 13,
                        color: AppTheme.colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.spacing != null,
                    child: SizedBox(
                      width: widget.spacing,
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                      bloc: _cartBloc,
                      builder: (context, state) {
                        final selectedProductsList = state.selectedCartProducts;
                        final index = selectedProductsList.indexWhere(
                            (cp) => cp.product.title == widget.product.title);
                        return Text(
                          index == -1
                              ? '0'
                              : state.selectedCartProducts[index].quantity
                                  .toString(),
                          style: AppTheme.textStyles.montserrat600.copyWith(
                            fontSize: 13,
                            color: AppTheme.colors.white,
                          ),
                        );
                      }),
                  Visibility(
                    visible: widget.spacing != null,
                    child: SizedBox(
                      width: widget.spacing,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _cartBloc.add(AddProductEvent(product: widget.product));
                    },
                    child: Text(
                      '+',
                      style: AppTheme.textStyles.montserrat600.copyWith(
                        fontSize: 13,
                        color: AppTheme.colors.white,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
