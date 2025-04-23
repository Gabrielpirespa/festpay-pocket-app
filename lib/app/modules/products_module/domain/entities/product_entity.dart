import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? image;
  final double? price;
  final String? title;
  final String? description;

  const ProductEntity({
    required this.image,
    required this.price,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [image, price, title, description];

  @override
  bool get stringify => true;
}
