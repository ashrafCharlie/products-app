import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/features/products/domain/repositories/product_repository.dart';
import 'package:products_app/features/products/presentation/bloc/product_event.dart';
import 'package:products_app/features/products/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}):super(ProductInitState()){
    
    on<GetProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      try{
      final products =  await productRepository.getProducts();

      emit(ProductLoadedState(products: products));

      }catch(e){
        emit(ProductErrorState(message: e.toString()));
      }

    },);
  }
}