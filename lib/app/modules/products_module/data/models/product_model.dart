import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {super.image, super.price, super.title, super.description});

  factory ProductModel.fromEntity(ProductEntity productEntity) => ProductModel(
        image: productEntity.image,
        price: productEntity.price,
        title: productEntity.title,
        description: productEntity.description,
      );

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        image: map['images']?[0] ?? '',
        price: map['price'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
      );
}
