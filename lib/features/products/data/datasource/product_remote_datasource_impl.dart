import 'package:dio/dio.dart';
import 'package:products_app/features/products/data/datasource/product_remote_datasource.dart';
import 'package:products_app/features/products/data/models/product_model.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio dio;
  const  ProductRemoteDatasourceImpl({required this.dio});
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('/products');
    final List<dynamic> productsJson = response.data['products'];
    return productsJson.map((json) => ProductModel.fromJson(json) ,).toList();
  }
}