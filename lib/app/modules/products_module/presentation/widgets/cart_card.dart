import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/cart_product.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/add_and_remove_widget.dart';
import 'package:flutter/widgets.dart';

class CartCard extends StatelessWidget {
  final CartProduct cartProduct;
  const CartCard({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppTheme.colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 11.0,
          horizontal: 24,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: Image.network(
                cartProduct.product.image ?? '',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      cartProduct.product.title ?? '',
                      style: AppTheme.textStyles.montserrat600
                          .copyWith(fontSize: 17, color: AppTheme.colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'R\$ ${cartProduct.product.price.toString().replaceAll('.', ',')}',
                        style: AppTheme.textStyles.montserrat600.copyWith(
                          fontSize: 15,
                          color: AppTheme.colors.primaryColor,
                        ),
                      ),
                      AddAndRemoveWidget(
                        product: cartProduct.product,
                        spacing: 10,
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
