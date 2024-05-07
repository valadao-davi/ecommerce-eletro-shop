import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/produtos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final int index;
   HomePage({super.key, required this.index});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text('Eletro Shop', style: TextStyle(color: Colors.white,)),
        backgroundColor: Colors.black,
        actions:  [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Produtos(index: widget.index)));
            }, icon: Icon(Icons.shop, color: Colors.white)),
          ),          
          ]
      ),
      body:
      Column(
        children:[
          Column(
                children: [
                  const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
              image: NetworkImage('https://i0.wp.com/tashopp.com.br/loja/wp-content/uploads/2022/01/Banner-Eletronics.jpg?fit=1900%2C650&ssl=1'),
              alignment: Alignment.topCenter,
                              ),
                            ),
                            Container(
                              
                              width: double.infinity,
                              height: 48,
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              decoration: BoxDecoration(
              color: Colors.grey[300],
              border: const Border(bottom: BorderSide(color: Colors.grey, width: 1.0)
              ),
              ),
              child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Confira nossos produtos!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                  ],
                ))]
                ), 
          Expanded(
            child: Consumer2<ProductController, UserController>(
            
            builder: (context, product,UserController, child) {
              
              List<ProductModel> products = product.products;
              List<UserModel> user = UserController.users;
              

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  
                  return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Favoritos())),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              height: 250,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      width: 132,
                                      height: 132,
                                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        child: Image(
                                          image: NetworkImage(products[index].url),
                                          alignment: Alignment.topCenter,
                                        ),   
                                      ),
                                    ),
                                    user[widget.index].gerente
                                    ? IconButton(onPressed: (){
                                      product.deletarProduto(index);
                                    }, icon: Icon(Icons.delete)) :
                                    IconButton(onPressed: (){
                                      var product = ProductModel(
                                        name: products[index].name, 
                                        price: products[index].price, 
                                        description: products[index].description, 
                                        url: products[index].url);
                                        UserController.addToCart("davinovo.valadao@gmail.com", product);
                                    }, icon: Icon(Icons.shop)),
                                    Container(
                                      height: 20,
                                      child: Text(products[index].name, textAlign: TextAlign.center,)),
                                      Text('R\$: ${products[index].price}', style: TextStyle(fontSize: 18))
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]);
                },
              );
                    }),
          )]));
  }
}