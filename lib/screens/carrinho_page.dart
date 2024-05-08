import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Produtos extends StatefulWidget {
  final int index;
  const Produtos({super.key, required this.index});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu carrinho"),
        actions: [
          IconButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> Favoritos())); }, icon: const Icon(Icons.favorite)),
          IconButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(index: widget.index))); }, icon: const Icon(Icons.home)),
        ],
      ),
      body:FutureBuilder<List<ProductModel>>(
        future:userProvider.carrinhosProductsUser(widget.index),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasData){
              List<ProductModel>? carrinho = snapshot.data;
              if(carrinho!.isEmpty){
                return Center(child: Text("Sem dados!"),);
              }
              return ListView.builder(
                itemCount: carrinho.length,
                itemBuilder: (context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Text(carrinho[index].name, textAlign: TextAlign.center,),
                     Text('R\$: ${carrinho[index].price}', style: TextStyle(fontSize: 18))
                                    
                    ],
                  );
                },
              );
            }
            return const Text("Sem dados");
          },
      ),
    );
  }
}