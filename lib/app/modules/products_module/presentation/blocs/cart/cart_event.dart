part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object?> get props => [];
}

class AddProductEvent extends CartEvent {
  final ProductEntity product;
  const AddProductEvent({required this.product});
}

class RemoveProductEvent extends CartEvent {
  final String title;
  const RemoveProductEvent({required this.title});
}

class InsertCouponEvent extends CartEvent {
  final String couponValue;
  const InsertCouponEvent({required this.couponValue});
}

class FinalizePurchaseEvent extends CartEvent {}

class ResetStatusEvent extends CartEvent {}

class ClearCartEvent extends CartEvent {}
