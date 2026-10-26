import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String thumbnail;
 const ProductEntity({required this.id, required this.description, required this.price, required this.rating, required this.thumbnail, required this.title});
 @override
  List<Object?> get props => [id,title,description,price,rating,thumbnail];
}