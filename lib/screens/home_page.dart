import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/produtos_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        actions: [
          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favoritos())); }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Produtos())); }, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Consumer<ProductController>(
        builder: (context, product, child){
          List<ProductModel> products = product.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(products[index].name),
                  Image.network(products[index].url, width: 100, height: 100),
                ],
              );
              
            }          
          );
        },
      ),
    );
  }
}