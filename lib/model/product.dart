// ignore_for_file: prefer_collection_literals, unnecessary_new

class Product {
  String? id;
  String? code;
  String? name;
  String? desciption;

  Product({this.id , this.code , this.name, this.desciption});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      code:json["code"],
      name: json["name"],
      desciption: json["desciption"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['desciption'] = desciption;
    return data;
  }
}
