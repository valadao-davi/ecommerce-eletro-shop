
import 'package:ecommerce/models/product_model.dart';

class UserModel {
  String username;
  String email;
  String senha;
  bool gerente;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];

  UserModel({required this.username, required this.email, required this.senha, required this.gerente});

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
  
  setUsername(String username){
    if (username.isNotEmpty) {
        this.username = username;
        return;
      }else{
        print("Usuário inválido!");
  
      }
  }

  setEmail(String email){
    if(email.isNotEmpty && email.contains("@") && email.contains(".com")){
      this.email = email;
      return;
    }else{
      print("Email inválido!");
      this.email = '';
      return;
    }
  }
  
  setSenha(String senha){
    if(senha.isNotEmpty && senha.length >= 6){
      this.senha = senha;
      return;
    }else{
      print("Senha inválida!");
      this.senha = '';
      return;

    }
  }
  @override
  String toString (){
    return "email: ${email}, senha: ${senha}";
  }


}