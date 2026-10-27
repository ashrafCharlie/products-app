import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/network/dio_client.dart';
import 'package:products_app/features/home/presentation/screens/home_screen.dart';
import 'package:products_app/features/products/data/datasource/product_remote_datasource_impl.dart';
import 'package:products_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:products_app/features/products/domain/repositories/product_repository.dart';
import 'package:products_app/features/products/presentation/bloc/product_bloc.dart';

void main() {
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ProductRepository>(
      create: (context) => ProductRepositoryImpl(productRemoteDatasource: ProductRemoteDatasourceImpl(dio: DioClient().dio)),
      child: BlocProvider(
         create: (context) => ProductBloc(productRepository:  context.read<ProductRepository>() ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: HomeScreen(),
        ),
      ),
    );
  }
}