import 'package:festpay_pocket_app/app/core/services/rest_client/rest_client_service.dart';
import 'package:festpay_pocket_app/app/core/utils/apis/http_endpoints.dart';
import 'package:festpay_pocket_app/app/core/utils/errors/failures.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/datasources/fetch_products_remote_data_source.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/models/product_model.dart';

class FetchProductsRemoteDataSourceImpl
    implements FetchProductsRemoteDataSource {
  final RestClientService _client;

  FetchProductsRemoteDataSourceImpl(this._client);
  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response =
          await _client.get(url: HttpEndpoints.getProductsEndpoint);

      if (response.statusCode == 200) {
        final data = response.data;

        final List productsJson = data['products'];

        final List<ProductModel> productsList =
            productsJson.map((item) => ProductModel.fromMap(item)).toList();

        return productsList;
      }
      throw ServerFailure();
    } catch (error) {
      throw ServerFailure();
    }
  }
}
