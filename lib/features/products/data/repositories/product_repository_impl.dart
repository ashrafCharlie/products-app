import 'package:products_app/features/products/data/datasource/product_remote_datasource.dart';
import 'package:products_app/features/products/domain/entities/product_entity.dart';
import 'package:products_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDatasource productRemoteDatasource;
  const ProductRepositoryImpl({required this.productRemoteDatasource});
  @override
  Future<List<ProductEntity>> getProducts() {
    return productRemoteDatasource.getProducts();
  }
}