import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier{

  final List<ProductModel> _products = [
    ProductModel(
    name: "MacBook", 
    price: 9999.99,
    description: "M3", 
    url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbookair-og-202402?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1707414684423"
    ),

    ProductModel(
    name: "SmartPhone", 
    price: 6999.99, 
    description: "Iphone 15", 
    url: "https://m.media-amazon.com/images/I/41RpmPYWXLL._AC_UF1000,1000_QL80_DpWeblab_.jpg"
    ),
    
    ProductModel(
    name: "Caixa de som", 
    price: 200.99, 
    description: "JBL", 
    url: "https://m.media-amazon.com/images/I/61qMO3TS2RL._AC_UF1000,1000_QL80_DpWeblab_.jpg"
    ),
    
    ProductModel(
    name: "Notebook Samsung Galaxy Book2 Intel Core i5-1235U, 8GB RAM",
    price: 2499.99,
    description: "SSD 256GB, 15.6\" Full HD, Windows 11 Home, Grafite - NP550XED-KF2BR",
    url: "https://m.media-amazon.com/images/I/419J3K8mKPL._AC_.jpg"
    ),

    ProductModel(
    name: "Controle Microsoft Xbox Carbon Black, Sem Fio", 
    price: 399.81, 
    description: "Para Xbox Series X e S, Preto - Qat-00007", 
    url: "https://images.tcdn.com.br/img/img_prod/1042771/controle_sem_fio_bluetooth_plug_p2_carbon_black_cabo_usb_c_xbox_series_x_s_one_windows_10_android_e__295_2_f4d676dab1d141bd3e9d1b471d35e83d.jpg"
    ),
    
  ];

  List<ProductModel> get products => _products;

  void novoProduto(ProductModel product){
   var contem = _products.contains(product);
   if(contem){
      throw Exception("O produto já existe na lista");
   }else{
    notifyListeners();
    _products.add(product);
   }
  }


}