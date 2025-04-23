import 'package:equatable/equatable.dart';

import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';

class CartProduct extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartProduct({
    required this.product,
    this.quantity = 1,
  });

  CartProduct copyWithIncreasedQuantity() {
    return CartProduct(
      product: product,
      quantity: quantity + 1,
    );
  }

  CartProduct copyWithDecreasedQuantity() {
    return CartProduct(
      product: product,
      quantity: quantity - 1,
    );
  }

  double get totalAmount => (product.price ?? 0) * quantity;

  @override
  List<Object> get props => [product, quantity];
}
