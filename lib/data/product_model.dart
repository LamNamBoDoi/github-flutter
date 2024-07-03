import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final List<String> size;
  final List<String> ice;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      List<String>? size,
      List<String>? ice})
      : size = ['Small', 'Medium', 'Large'],
        ice = ['Less', 'Normal'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'size': listToMap(size),
      'ice': listToMap(ice)
    };
  }

  factory Product.fromMap(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Product(
        id: data['id'],
        name: data['name'],
        price: data['price'].toDouble(),
        size: listFromMap(data['size']),
        ice: listFromMap(data['ice']));
  }
}

Map<String, dynamic> listToMap(List<String> list) {
  Map<String, dynamic> map = {};
  var i = 0;
  if (list.isEmpty) return map;
  map.clear();
  map = {for (i = 0; i < list.length; i++) i.toString(): list[i]};

  return map;
}

List<String> listFromMap(Map<String, dynamic> map) {
  List<String> list = [];
  if (map.isEmpty) {
    return [];
  }
  list.clear();
  map.forEach((key, value) {
    list.add(value.toString());
  });
  return list;
}
