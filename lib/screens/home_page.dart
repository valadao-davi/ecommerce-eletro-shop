import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/carrinho_page.dart';
import 'package:ecommerce/screens/tela_login.dart';
import 'package:flutter/cupertino.dart';
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Produtos(index: widget.index)));
                }, icon: Icon(Icons.shopping_cart_outlined, color: Colors.white)),
              ),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: IconButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginInicial()));
                 },icon: Icon(Icons.logout, color: Colors.white),
               )),
            ],
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
                              color: Colors.white,
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Confira nossos produtos!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.purple[800])),
                  ],
                ))]
                ),
          Expanded(
  child: Consumer2<ProductController, UserController>(
    builder: (context, product, userController, child) {
      List<ProductModel> products = product.products;
              List<UserModel> user = userController.users;
              

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          mainAxisSpacing: 8.0, 
          crossAxisSpacing: 8.0, 
          childAspectRatio: 1,
          mainAxisExtent: 352
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                      width: 200, 
                      height: 200, 
                      color: Colors.white, 
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1, 
                          child: Image.network(
                            products[index].url,
                            fit: BoxFit.contain, 
                          ),
                        ),
                      ),
                    ),
                      //               user[widget.index].gerente
                      //               ? IconButton(onPressed: (){
                      //                 product.deletarProduto(index);
                      //               }, icon: Icon(Icons.delete)) :
                      //  IconButton(
                      //   onPressed: () {
                      //     var product = ProductModel(
                      //       name: products[index].name, 
                      //       price: products[index].price, 
                      //       description: products[index].description, 
                      //       url: products[index].url
                      //     );
                      //     userController.addToCart(user[widget.index].email, product);
                      //   },
                      //   icon: Icon(Icons.shopping_cart_outlined),
                      // ), 
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(height: 12,),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: LimitedBox(
                            maxHeight: 20,
                            child: Text(
                            products[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                                                     ),
                          ),
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'R\$ ${products[index].price}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
                            child: GestureDetector(
                              onTap: () {
                                var produto2 = ProductModel(
                                name: products[index].name, 
                                price: products[index].price, 
                                description: products[index].description, 
                                url: products[index].url
                              );
                                user[widget.index].gerente? product.deletarProduto(index):
                                userController.addToCart(user[widget.index].email, produto2);

                                
                              },
                             


                              child: Container(
                                width: 140,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.purple[600],
                                  borderRadius: BorderRadius.circular(100)
                                ),child: Center(child: 
                                 user[widget.index].gerente?
                                 Text("REMOVER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),):

                                Text("ADICIONAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),),),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
       
  });}))])
  
  
  );
  }
}
        