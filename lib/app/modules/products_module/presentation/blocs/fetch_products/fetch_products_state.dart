part of 'fetch_products_bloc.dart';

abstract class FetchProductsState extends Equatable {
  const FetchProductsState();
  @override
  List<Object?> get props => [];
}

class FetchProductsInitialState extends FetchProductsState {
  const FetchProductsInitialState();
}

class FetchProductsLoadingState extends FetchProductsState {
  const FetchProductsLoadingState();
}

class FetchProductsErrorState extends FetchProductsState {
  final String message;

  const FetchProductsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FetchProductsSuccessState extends FetchProductsState {
  final List<ProductEntity> products;
  final String? search;

  const FetchProductsSuccessState({required this.products, this.search});

  List<ProductEntity> get filteredList {
    if (search == null || (search?.isEmpty ?? true)) {
      return products;
    }
    return products
        .where((item) => item.title!.toLowerCase().contains(search!))
        .toList();
  }

  @override
  List<Object?> get props => [products, search];
}
