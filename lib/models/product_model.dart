class ProductModel {
  String name;
  double price;
  String description;
  String url;

  ProductModel({required this.name, required this.price, required this.description, required this.url}) {
    if (name.isNotEmpty) {
      throw ArgumentError("Nome não pode estar vazio");
    }
    if (price < 0) {
      throw ArgumentError("Preço inválido!");
    }
  }

  
}