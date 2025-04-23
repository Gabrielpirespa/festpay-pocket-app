import 'package:equatable/equatable.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/cart_product.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddProductEvent>(_handleAddCartEvent);
    on<RemoveProductEvent>(_handleRemoveCartEvent);
    on<InsertCouponEvent>(_handleInsertCouponEvent);
    on<FinalizePurchaseEvent>(_handleFinalizePurchaseEvent);
    on<ClearCartEvent>(_handleClearCartEvent);
    on<ResetStatusEvent>(_handleResetStatusEvent);
  }

  void _handleAddCartEvent(
    AddProductEvent event,
    Emitter<CartState> emit,
  ) {
    final currentProducts = List<CartProduct>.from(state.selectedCartProducts);
    final index =
        currentProducts.indexWhere((cp) => cp.product == event.product);

    if (index != -1) {
      final updatedProduct = currentProducts[index].copyWithIncreasedQuantity();
      currentProducts[index] = updatedProduct;
    } else {
      currentProducts.add(CartProduct(product: event.product));
    }

    emit(state.copyWith(selectedCartProducts: currentProducts));
  }

  void _handleRemoveCartEvent(
    RemoveProductEvent event,
    Emitter<CartState> emit,
  ) {
    final currentProducts = List<CartProduct>.from(state.selectedCartProducts);
    final index =
        currentProducts.indexWhere((cp) => cp.product.title == event.title);

    if (index == -1) {
      return;
    }
    final currentProduct = currentProducts[index];
    if (currentProduct.quantity > 1) {
      final updatedProduct = currentProducts[index].copyWithDecreasedQuantity();
      currentProducts[index] = updatedProduct;
    } else {
      currentProducts.removeAt(index);
    }

    emit(state.copyWith(selectedCartProducts: currentProducts));
  }

  void _handleInsertCouponEvent(
    InsertCouponEvent event,
    Emitter<CartState> emit,
  ) {
    final String couponValueText = event.couponValue.replaceAll('%', '').trim();

    final double couponValue = double.tryParse(couponValueText) ?? 0;

    final isValid = couponValue > 0 && couponValue <= 100;

    final double coupon = isValid ? couponValue : 0;

    emit(state.copyWith(coupon: coupon, isCouponValid: isValid));
  }

  void _handleFinalizePurchaseEvent(
    FinalizePurchaseEvent event,
    Emitter<CartState> emit,
  ) {
    final double purchaseAmount = state.paymentAmount;

    const double walletAmount = 360;

    if (purchaseAmount <= walletAmount) {
      emit(state.copyWith(status: CartStatus.success));
    } else {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  void _handleResetStatusEvent(
    ResetStatusEvent event,
    Emitter<CartState> emit,
  ) {
    emit(state.copyWith(status: CartStatus.idle));
  }

  void _handleClearCartEvent(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) {
    emit(const CartState());
  }
}
