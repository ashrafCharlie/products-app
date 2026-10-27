import 'package:flutter/material.dart';
import 'package:products_app/features/products/domain/entities/product_entity.dart';
class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
        centerTitle: true,
      ),
      body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(widget.product.thumbnail),
                ),
            
                SizedBox(height: 16.0,),
            
                Text(widget.product.title,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
            
                SizedBox(height: 8.0,),
            
                Text(widget.product.description,style: TextStyle(
                  fontSize: 14.0,
                ),),
            
                SizedBox(height: 8.0,),
            
                Text("\$${widget.product.price}",style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber
                ),),
            
                SizedBox(height: 12.0,),
                
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      onPressed: (){
                        //demo 
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Demo:purchase successful")));
                        Navigator.pop(context);
                      }, child: Text("Buy now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
            
                )
              ],
            ),
          ),
        ),
        )
        ),
    );
  }
}