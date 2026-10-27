import 'package:products_app/features/products/domain/entities/product_entity.dart';

sealed class ProductState {

}


class ProductInitState extends ProductState{}

class ProductLoadingState extends ProductState{}

class ProductLoadedState extends ProductState{
  final List<ProductEntity> products;
  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState{
  final String message;
  ProductErrorState({required this.message});
}