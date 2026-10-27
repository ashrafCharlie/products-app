import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products_app/features/home/presentation/widgets/my_textfield.dart';
import 'package:products_app/features/products/presentation/bloc/product_bloc.dart';
import 'package:products_app/features/products/presentation/bloc/product_event.dart';
import 'package:products_app/features/products/presentation/bloc/product_state.dart';
import 'package:products_app/features/products/presentation/screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductsEvent());
  }
  @override
  Widget build(BuildContext context) {
    final textTheme  = Theme.of(context).textTheme;
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Products  App',style:GoogleFonts.roboto(
                fontSize: 35,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold
              )),

              SizedBox(height: 16,),
              
              //demo search box
            MyTextfield(),
            
            SizedBox(height: 16.0,),
          
            Text("Products",style: GoogleFonts.roboto(
              fontSize: 20,
              letterSpacing: 1.0
            ),),
          
            SizedBox(height: 8.0,),
          
            Expanded(
              child: BlocBuilder<ProductBloc,ProductState>(
                builder: (context, state) {
                if(state is ProductLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is ProductErrorState){
                  return Center(child: Text('An error occured: ${state.message}'),);
                }
                if(state is ProductLoadedState){
                  final products = state.products;
                  if(products.isEmpty){
                    return Center(child: Text('No Product available right now..'),);
                  }
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75
                      ),
             
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () =>  Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(product: product,),)),
                        child: Card(
                          child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.network(
                                    product.thumbnail,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),
                        
                              Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium,
                              ),
                        
                              const SizedBox(height: 6),
                        
                              Text(
                                '\$${product.price}',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        
                              const SizedBox(height: 8),
                        
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white
                                  ),
                                  onPressed: () {
                                    //demo 
                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added to cart")));

                                  },
                                  child: const Text('Add to Cart',style: TextStyle(
                                    color: Colors.black,
                                  ),),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                                            ),
                      );
                    },
                    );
                }
                return SizedBox.shrink();
              },),
            )
          
          
            ],
          ),
      )),
    );
  }
}