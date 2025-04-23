import 'package:festpay_pocket_app/app/modules/products_module/data/models/product_model.dart';

abstract class FetchProductsRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
}
