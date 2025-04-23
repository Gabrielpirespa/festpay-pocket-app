import 'package:dartz/dartz.dart';
import 'package:festpay_pocket_app/app/core/utils/errors/failures.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/repositories/fetch_products_repository.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/usecases/fetch_products_use_case.dart';

class FetchProductsUseCaseImpl implements FetchProductsUseCase {
  final FetchProductsRepository _repository;

  FetchProductsUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() {
    return _repository.fetchProducts();
  }
}
