part of 'cart_bloc.dart';

enum CartStatus { idle, processing, success, error }

class CartState extends Equatable {
  final List<CartProduct> selectedCartProducts;
  final double? coupon;
  final CartStatus status;
  final bool isCouponValid;

  const CartState({
    this.selectedCartProducts = const [],
    this.coupon,
    this.status = CartStatus.idle,
    this.isCouponValid = false,
  });

  CartState copyWith({
    List<CartProduct>? selectedCartProducts,
    double? coupon,
    CartStatus? status,
    bool? isCouponValid,
  }) {
    return CartState(
      selectedCartProducts: selectedCartProducts ?? this.selectedCartProducts,
      coupon: coupon ?? this.coupon,
      status: status ?? this.status,
      isCouponValid: isCouponValid ?? this.isCouponValid,
    );
  }

  double get totalAmount => selectedCartProducts.isNotEmpty
      ? selectedCartProducts.map((p) => p.totalAmount).reduce((a, b) => a + b)
      : 0;

  String get totalAmountFormatted =>
      'R\$ ${totalAmount.toStringAsFixed(2).replaceAll('.', ',')}';

  double get couponValueFormatted => coupon != null ? (coupon! / 100) : 0;

  String get couponPercentageValue => coupon != null && coupon != 0
      ? '${coupon?.toStringAsFixed(0).replaceAll('.', ',')}%'
      : '-';

  double get paymentAmount =>
      coupon == null ? totalAmount : totalAmount * (1 - couponValueFormatted);

  String get paymentAmountFormatted =>
      'R\$ ${paymentAmount.toStringAsFixed(2).replaceAll('.', ',')}';

  @override
  List<Object?> get props => [selectedCartProducts, coupon, status];
}
