import 'package:dartz/dartz.dart';
import 'package:festpay_pocket_app/app/core/utils/errors/failures.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';

abstract class FetchProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchProducts();
}
