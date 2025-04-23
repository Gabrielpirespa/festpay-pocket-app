import 'package:festpay_pocket_app/app/app_module.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/datasources/fetch_products_remote_data_source.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/datasources/fetch_products_remote_data_source_impl.dart';
import 'package:festpay_pocket_app/app/modules/products_module/data/repositories/fetch_products_repository_impl.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/repositories/fetch_products_repository.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/usecases/fetch_products_use_case.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/usecases/fetch_products_use_case_impl.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/cart/cart_bloc.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/fetch_products/fetch_products_bloc.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/pages/error_page.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/pages/products_page.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/pages/shopping_cart_page.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/pages/success_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsModule extends Module {
  @override
  void binds(Injector i) {
    i.add<FetchProductsRemoteDataSource>(FetchProductsRemoteDataSourceImpl.new);
    i.add<FetchProductsRepository>(FetchProductsRepositoryImpl.new);
    i.add<FetchProductsUseCase>(FetchProductsUseCaseImpl.new);
    i.add<FetchProductsBloc>(FetchProductsBloc.new);
    i.addInstance<CartBloc>(CartBloc());
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(RouteManager r) {
    r.child(
      '/products',
      child: (_) => const ProductsPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/cart',
      child: (_) => const ShoppingCartPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/success',
      child: (_) => const SuccessPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/error',
      child: (_) => const ErrorPage(),
      transition: TransitionType.noTransition,
    );
  }
}
