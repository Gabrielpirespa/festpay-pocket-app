import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/entities/product_entity.dart';
import 'package:festpay_pocket_app/app/modules/products_module/domain/usecases/fetch_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_products_event.dart';
part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  List<ProductEntity> _allProducts = [];

  final FetchProductsUseCase _fetchProductsUseCase;

  FetchProductsBloc({
    required FetchProductsUseCase fetchProductsUseCase,
  })  : _fetchProductsUseCase = fetchProductsUseCase,
        super(const FetchProductsInitialState()) {
    on<MakeFetchProductsEvent>(_handleMakeFetchProductsEvent);
    on<FilterFetchProductsEvent>(_handleFilterFetchProductsState);
  }

  Future<void> _handleMakeFetchProductsEvent(
    MakeFetchProductsEvent event,
    Emitter<FetchProductsState> emit,
  ) async {
    emit(
      const FetchProductsLoadingState(),
    );
    await _fetchProductsUseCase.fetchProducts().then(
          (value) => value.fold(
              (failure) => emit(
                    FetchProductsErrorState(message: failure.message),
                  ), (productsList) {
            _allProducts = productsList;

            emit(
              FetchProductsSuccessState(
                products: _allProducts,
              ),
            );
          }),
        );
  }

  Future<void> _handleFilterFetchProductsState(
    FilterFetchProductsEvent event,
    Emitter<FetchProductsState> emit,
  ) async {
    emit(const FetchProductsLoadingState());

    emit(
      FetchProductsSuccessState(
        products: _allProducts,
        search: event.searchText,
      ),
    );
  }
}
