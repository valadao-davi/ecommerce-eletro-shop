class ProductModel {
  String name;
  double price;
  String description;
  String url;

  ProductModel({required this.name, required this.price, required this.description, required this.url}){
    if (name.isEmpty) {
     print("Nome não pode estar vazio");
    }
    if (price < 0) {
      print("Preço inválido!");
    }
  }

  
}