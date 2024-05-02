import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {
  List<UserModel> users = [
    UserModel(username: "Davi", email: "davinovo.valadao@gmail.com", senha: "12345")
  ];

  void addToCart(String userEmail, ProductModel product){
    UserModel? user = users.firstWhere((element) => element.email == userEmail);
    if(user.email.isNotEmpty){
      user.products.add(product);
    }
  }

  void addFavorite(String userEmail, ProductModel product){
    UserModel? user = users.firstWhere((element) => element.email == userEmail);
    if(user.email.isNotEmpty){
      if(!user.favorites.contains(product)){
        user.favorites.add(product);
      }
    }
  }

  void addUser(UserModel user){
    if(user.email.contains("@") && user.email.contains(".com")){
      users.add(user);
      notifyListeners();
    }
  }


  void login(String email, String senha){
    var result = users.where((user) => user.email == email && user.senha == senha);
    if(result.isNotEmpty){
      print("Login feito com sucesso!");
      notifyListeners();
    }else{
      print("Login incorreto tente novamente!");
    }
  }

  
  Future<List<ProductModel>> favoriteProductsUser(index) async {
    return users[index].favorites;
    
  }
}