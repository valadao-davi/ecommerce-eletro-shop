import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/controllers/user_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/screens/favoritos_page.dart';
import 'package:ecommerce/screens/produtos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

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
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Produtos()));
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
                                    IconButton(onPressed: (){
                                      ProductModel product = ProductModel(
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
        // ListView(
        //   children:[ 
        //     Column(
        //       children: [
        //         const Padding(
        //           padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        //           child: Image(
        //             image: NetworkImage('https://i0.wp.com/tashopp.com.br/loja/wp-content/uploads/2022/01/Banner-Eletronics.jpg?fit=1900%2C650&ssl=1'),
        //             alignment: Alignment.topCenter,
        //           ),
        //         ),
        //         Container(
                  
        //           width: double.infinity,
        //           height: 48,
        //           padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        //           decoration: BoxDecoration(
        //             color: Colors.grey[300],
        //             border: const Border(bottom: BorderSide(color: Colors.grey, width: 1.0)
        //             ),
        //             ),
        //             child: const Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Text('Confira nossos produtos!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        //                 ],
        //               ),
        //               ),
          
        //               Column(
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://images.kabum.com.br/produtos/fotos/520072/notebook-galaxy-book2-intel-core-i5-1235u-windows-11-home-8gb-256gb-ssd-intel-iris-xe-15-6-full-hd-led-np550xed-kf2br_1706818190_gg.jpg'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                   Container(
        //                                     height: 20,
        //                                     child: Text('Notebook Samsung Galaxy Book2 Intel Core i5-1235U, 8GB RAM, SSD 256GB, 15.6" Full HD, Windows 11 Home, Grafite - NP550XED-KF2BR', textAlign: TextAlign.center))
        //                                   const Text('R\$ 2.499,00', style: TextStyle(fontSize: 18)),
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://images.kabum.com.br/produtos/fotos/sync_mirakl/158630/Controle-Microsoft-Xbox-Carbon-Black-Sem-Fio-Para-Xbox-Series-X-e-S-Preto-Qat-00007_1713815586_gg.jpg'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                     ),), 
        //                                   const Text('Controle Microsoft Xbox Carbon Black, Sem Fio, Para Xbox Series X e S, Preto - Qat-00007', textAlign: TextAlign.center),
        //                                   const Text('R\$ 399,81', style: TextStyle(fontSize: 18)),
                                          
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
                              
        //                     ],
        //                   ),
        
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://images.kabum.com.br/produtos/fotos/227818/headset-gamer-redragon-zeus-chroma-mk-ii-rgb-surround-7-1-usb-drivers-53mm-preto-vermelho-h510-rgb_1631555309_gg.jpg'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                     ),), 
        //                                   const Text('Headset Gamer Redragon Zeus X, Chroma Mk.II, RGB, Surround 7.1, USB, Drivers 53MM, Preto/Vermelho - H510-RGB', textAlign: TextAlign.center),
        //                                   const Text('R\$ 229,90', style: TextStyle(fontSize: 18)),
                                          
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
          
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://images.kabum.com.br/produtos/fotos/308480/placa-de-video-msi-nvidia-geforce-rtx-3050-ventus-2x-8g-oc-8gb-gddr6-dlss-ray-tracing-geforce-rtx-3050-ventus-2x-8g-oc_1644002598_gg.jpg'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                     ),), 
        //                                   const Text('Placa de Vídeo RTX 3050 Ventus 2X 8G OC MSI NVIDIA Geforce, 8GB GDDR6, DLSS, Ray Tracing - Geforce RTX 3050 Ventus 2X 8G OC', textAlign: TextAlign.center),
        //                                   const Text('R\$ 1.249', style: TextStyle(fontSize: 18)),
                                          
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
                              
        //                     ],
        //                   ),
        
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //                     children: [
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://www.kabum.com.br/produto/444038/monitor-gamer-lg-ultragear-27-full-hd-144hz-1ms-ips-hdmi-e-displayport-hdr-10-99-srgb-freesync-premium-vesa-27gn65r'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                     ),), 
        //                                   const Text('Monitor Gamer LG UltraGear 27 Full HD, 144Hz, 1ms, IPS, HDMI e DisplayPort, HDR 10, 99% sRGB, FreeSync Premium, VESA - 27GN65R', textAlign: TextAlign.center),
        //                                   const Text('R\$ 949,99', style: TextStyle(fontSize: 18)),
                                          
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
          
        //                       Expanded(
        //                         child: GestureDetector(
        //                           onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => Favoritos())),
        //                           child: Container(
        //                             margin: const EdgeInsets.all(8),
        //                             height: 250,
        //                             child: Container(
        //                               color: Colors.white,
        //                               child: Column(
        //                                 children: [
        //                                   Container(
        //                                     margin: const EdgeInsets.all(8),
        //                                     width: 132,
        //                                     height: 132,
        //                                     decoration: const BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10)),
        //                                     ),
        //                                     child:const ClipRRect(
        //                                       borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                                              
        //                                     child: Image(
        //                                       image: NetworkImage('https://www.kabum.com.br/produto/471929/cadeira-gamer-kbm-gaming-tempest-cg600-preta-e-vermelho-com-almofadas-descanso-para-pernas-retratil-reclinavel-kgcg600ptvm'),
        //                                       alignment: Alignment.topCenter,
        //                                     )
        //                                     ),), 
        //                                   const Text('Cadeira Gamer KBM! GAMING Tempest CG600, Preta e Vermelho, Com Almofadas, Descanso Para Pernas Retrátil, Reclinável - KGCG600PTVM', textAlign: TextAlign.center),
        //                                   const Text('R\$ 689,90', style: TextStyle(fontSize: 18)),
        //                               ]),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               )
        //         ]),
        // ]),
        
        /* 
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
             */