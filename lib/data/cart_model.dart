import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  final String id;
  final String name;
  final double price;
  final String? size;
  final String? ice;
  int? quantity;

  Cart(
      {required this.id,
      required this.name,
      required this.price,
      this.size,
      this.ice,
      this.quantity});

  factory Cart.fromMap(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Cart(
        id: data['id'],
        name: data['name'],
        price: data['price'],
        size: data['size'],
        ice: data['ice'],
        quantity: data['quantity']);
  }
  factory Cart.fromMapmap(Map<String, dynamic> map) {
    return Cart(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        size: map['size'],
        ice: map['ice'],
        quantity: map['quantity']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'size': size,
      'ice': ice,
      'quantity': quantity
    };
  }
}
