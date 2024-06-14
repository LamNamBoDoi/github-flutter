import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/cart_model.dart';

class OrderModel {
  final String id;
  final List<Cart> carts;
  final double price;

  OrderModel({
    required this.id,
    required this.carts,
    required this.price,
  });
  factory OrderModel.fromMap(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return OrderModel(
      id: doc.id,
      carts: listFromMap(data['carts']),
      price: data['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'carts': listToMap(carts),
      'price': price,
    };
  }
}

Map<String, dynamic> listToMap(List<Cart> list) {
  Map<String, dynamic> map = {};
  var i = 0;
  if (list.isEmpty) return map;
  map.clear();
  map = {for (i = 0; i < list.length; i++) i.toString(): list[i].toMap()};

  return map;
}

List<Cart> listFromMap(Map<String, dynamic> map) {
  List<Cart> list = [];

  if (map.isEmpty) {
    return [];
  }
  list.clear();
  map.forEach((key, value) {
    list.add(Cart.fromMapmap(value));
  });

  return list;
}
