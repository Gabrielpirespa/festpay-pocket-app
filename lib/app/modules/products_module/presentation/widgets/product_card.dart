import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/add_and_remove_widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 120,
              child: Image.network(
                product.image ?? "",
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                product.title ?? '',
                style: AppTheme.textStyles.montserrat600.copyWith(
                  fontSize: 22,
                  height: 1,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'R\$ ${product.price.toString().replaceAll('.', ',')}',
              style: AppTheme.textStyles.montserrat700.copyWith(
                fontSize: 17,
                color: AppTheme.colors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 59),
              child: AddAndRemoveWidget(
                product: product,
              ),
            )
          ],
        ),
      ),
    );
  }
}
