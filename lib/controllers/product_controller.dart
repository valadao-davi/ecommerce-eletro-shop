import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier{

  final List<ProductModel> _products = [
    ProductModel(
    name: "MacBook", 
    price: 100000.00,
    description: "M3", 
    url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbookair-og-202402?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1707414684423"
    ),

    ProductModel(
    name: "SmartPhone", 
    price: 7000.00, 
    description: "Iphone 15", 
    url: "https://m.media-amazon.com/images/I/41RpmPYWXLL._AC_UF1000,1000_QL80_DpWeblab_.jpg"
    ),
    
    ProductModel(
    name: "Caixa de som", 
    price: 200.00, 
    description: "JBL", 
    url: "https://m.media-amazon.com/images/I/61qMO3TS2RL._AC_UF1000,1000_QL80_DpWeblab_.jpg"
    ),
    
    ProductModel(
    name: "Notebook Samsung Galaxy Book2 Intel Core i5-1235U, 8GB RAM",
    price: 2499.00,
    description: "SSD 256GB, 15.6\" Full HD, Windows 11 Home, Grafite - NP550XED-KF2BR",
    url: "https://images.kabum.com.br/produtos/fotos/520072/notebook-galaxy-book2-intel-core-i5-1235u-windows-11-home-8gb-256gb-ssd-intel-iris-xe-15-6-full-hd-led-np550xed-kf2br_1706818190_gg.jpg"
    ),

    ProductModel(
    name: "Controle Microsoft Xbox Carbon Black, Sem Fio", 
    price: 399.81, 
    description: "Para Xbox Series X e S, Preto - Qat-00007", 
    url: "https://images.kabum.com.br/produtos/fotos/sync_mirakl/158630/Controle-Microsoft-Xbox-Carbon-Black-Sem-Fio-Para-Xbox-Series-X-e-S-Preto-Qat-00007_1713815586_gg.jpg"
    ),
    
  ];

  List<ProductModel> get products => _products;
}