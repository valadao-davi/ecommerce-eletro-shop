import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier{

  final List<ProductModel> _products = [
    ProductModel(name: "MacBook", price: 100000.00, description: "M3", url: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/macbookair-og-202402?wid=1200&hei=630&fmt=jpeg&qlt=95&.v=1707414684423"),
    ProductModel(name: "SmartPhone", price: 7000.00, description: "Iphone 15", url: "https://m.media-amazon.com/images/I/41RpmPYWXLL._AC_UF1000,1000_QL80_DpWeblab_.jpg"),
    ProductModel(name: "Caixa de som", price: 200, description: "JBL", url: "https://m.media-amazon.com/images/I/61qMO3TS2RL._AC_UF1000,1000_QL80_DpWeblab_.jpg")
  ];

  List<ProductModel> get products => _products;
}