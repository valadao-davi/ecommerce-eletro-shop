import 'package:ecommerce/models/product_model.dart';

class UserModel {
  String username;
  String email;
  String senha;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];

  UserModel({required this.username, required this.email, required this.senha});

  void addProduct(ProductModel product){
    products.add(product);
  }

  void addFavorite(ProductModel favorite){
    if (!favorites.contains(favorite)) {
      favorites.add(favorite);
    }
  }

  removeItem(ProductModel item){
    if(favorites.contains(item)){
      favorites.removeAt((favorites.indexOf(item)));
    }else if(products.contains(item)){
      products.removeAt((products.indexOf(item)));
    }else{
      return "Item não encontrado";
    }
  }



}