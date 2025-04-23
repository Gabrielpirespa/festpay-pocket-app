import 'package:dartz/dartz.dart';
import 'package:festpay_pocket_app/app/core/services/network_checker/network_checker_service.dart';
import 'package:festpay_pocket_app/app/core/utils/errors/failures.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/datasources/fetch_products_remote_data_source.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/repositories/fetch_products_repository.dart';

class FetchProductsRepositoryImpl implements FetchProductsRepository {
  final FetchProductsRemoteDataSource _fetchProductsRemoteDataSource;
  final NetworkCheckerService _networkCheckerService;

  FetchProductsRepositoryImpl(
      this._fetchProductsRemoteDataSource, this._networkCheckerService);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async {
    if (await _networkCheckerService.isConnected) {
      try {
        final response = await _fetchProductsRemoteDataSource.fetchProducts();

        return Right(response);
      } on Failure catch (failure) {
        return Left(failure);
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
