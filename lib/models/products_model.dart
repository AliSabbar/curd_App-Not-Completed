// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductsModel {
  bool status;
  Data data;
  ProductsModel({
    required this.status,
    required this.data,
  });
  factory ProductsModel.fromJson(json) {
    return ProductsModel(
        status: json['status'], data: Data.fromJson(json['data']));
  }
}

class Data {
  List<dynamic> products;
  Data({
    required this.products,
  });
  factory Data.fromJson(json) {
    return Data(products: json['products']);
  }
}

class Products {
  int id;
  double price;
  String image;
  String name;
  String description;
  Products({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Products.fromJson(json) {
    return Products(
        id: json['id'],
        price: json['price'],
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}
