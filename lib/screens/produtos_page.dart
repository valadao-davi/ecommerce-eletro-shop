import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
        actions: [
          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Favoritos())); }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage())); }, icon: const Icon(Icons.home)),
        ],
      ),
      body: Consumer2<ProductController, UserController>(
        builder: (context, product, userController, child){
          List<ProductModel> products = product.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index){
              return  ListTile(
                title: Text(products[index].name),
                trailing: IconButton(
                  onPressed: (){
                    ProductModel product = ProductModel(
                      name: products[index].name, 
                      price: products[index].price, 
                      description: products[index].description,
                      url: products[index].url);
                      userController.addFavorite("davinovo.valadao@gmail.com", product);
                  },
                  icon: const Icon(Icons.favorite_outline),
                ),
              );
            }
          );
        }
      ),
    );
  }
}