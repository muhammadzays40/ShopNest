// ignore_for_file: prefer_collection_literals, unnecessary_this

class Product {
  String? name;
  String? description;
  int? price;
  String? image;

  Product({this.name, this.description, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}