import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/home_page.dart';
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

  void cadastrarUsuario(context, UserModel user){
    var result = users.where((u) => u.email == user.email);
    if(user.email.contains("@") && user.email.contains(".com")){
      users.add(user);
      notifyListeners();
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Row(
                    children: [
                        Text('Cadastro concluído, faça o seu login!'),
                        Icon(Icons.check)
                    ],
                )));
    }else if(result.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    children: [
                        Text('Email cadastrado, tente inserar um email novo!'),
                        Icon(Icons.error)
                    ],
                )));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                    children: [
                        Text('Insira uma email válido'),
                        Icon(Icons.error)
                    ],
                )));
    }
  }


  void login(context,String email, String senha){
    var result = users.where((user) => user.email == email && user.senha == senha);
    var index = users.indexWhere((element) => element.email == email);
    if(result.isNotEmpty){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> HomePage()), (route) => false);
      notifyListeners();
    }else{
      print("Login incorreto tente novamente!");
    }
  }

  
  Future<List<ProductModel>> favoriteProductsUser(index) async {
    return users[index].favorites;
    
  }

  Future<List<ProductModel>> carrinhosProductsUser(index) async {
    return users[index].products;
  }
}