part of 'fetch_products_bloc.dart';

abstract class FetchProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MakeFetchProductsEvent extends FetchProductsEvent {}

class FilterFetchProductsEvent extends FetchProductsEvent {
  final String searchText;

  FilterFetchProductsEvent({required this.searchText});
}
