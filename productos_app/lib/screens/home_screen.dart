import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if(productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        leading: IconButton(
          onPressed: (){
            authService.logOut();
            Navigator.pushReplacementNamed(context, 'login');
          }, 
          icon: const Icon(Icons.login_outlined)),
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {
              productsService.selectedProduct = productsService.products[index].copy(),
              Navigator.pushNamed(context, 'product')
            },
            child: ProductCard(product: productsService.products[index])
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          productsService.selectedProduct = Product(
            available: false, 
            name: '', 
            price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}