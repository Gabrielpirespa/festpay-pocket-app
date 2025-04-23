import 'package:festpay_pocket_app/app/config/themes/app_icons.dart';
import 'package:festpay_pocket_app/app/config/themes/app_theme.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/blocs/fetch_products/fetch_products_bloc.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/product_card.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/product_card_skeleton.dart';
import 'package:festpay_pocket_app/app/modules/products_module/presentation/widgets/product_types_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late FetchProductsBloc _fetchProductsBloc;
  final TextEditingController searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchProductsBloc = Modular.get<FetchProductsBloc>();
    _fetchProductsBloc.add(MakeFetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return BlocProvider<FetchProductsBloc>(
      create: (BuildContext context) => _fetchProductsBloc,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  top: 48.0,
                  bottom: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Image.asset(AppIcons.menuIcon),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: mediaQuery.width / 2,
                      child: Text(
                        'Cardápio do dia!',
                        style: AppTheme.textStyles.montserrat700.copyWith(
                          fontSize: 34,
                          color: AppTheme.colors.black,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    TextField(
                      onChanged: (value) => _fetchProductsBloc.add(
                        FilterFetchProductsEvent(
                          searchText: value,
                        ),
                      ),
                      cursorColor: AppTheme.colors.primaryColor,
                      decoration: InputDecoration(
                        hintText: 'Pesquisar',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Image.asset(AppIcons.searchIcon),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 35),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: ProductTypesTab(),
              ),
              const SizedBox(
                height: 65,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: BlocBuilder<FetchProductsBloc, FetchProductsState>(
                      bloc: _fetchProductsBloc,
                      builder: (context, state) {
                        if (state is FetchProductsSuccessState) {
                          final products = state.filteredList;

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  product: products[index],
                                );
                              });
                        }
                        if (state is FetchProductsErrorState) {
                          return Text(state.message);
                        }
                        if (state is FetchProductsLoadingState) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return const ProductCardSkeleton();
                              });
                        }
                        return const SizedBox();
                      }),
                ),
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() {
              _currentIndex = index;
              if (_currentIndex == 3) {
                Modular.to.pushNamed('cart');
              }
            }),
            backgroundColor: AppTheme.colors.backgroundColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppTheme.colors.primaryColor,
            unselectedItemColor: AppTheme.colors.gray3,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 29,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    size: 29,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 29,
                  ),
                  activeIcon: Icon(
                    Icons.favorite,
                    size: 29,
                  ),
                  label: 'Favoritos'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 29,
                ),
                activeIcon: Icon(
                  Icons.person_2,
                  size: 29,
                ),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 29,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart,
                  size: 29,
                ),
                label: 'Carrinho',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
