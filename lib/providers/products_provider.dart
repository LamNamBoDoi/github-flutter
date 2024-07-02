import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/product_model.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;
  bool _isLoading = false;
  get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    setLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      print('home: ${snapshot.docs.length}');
      _products.clear();
      for (DocumentSnapshot doc in snapshot.docs) {
        _products.add(Product.fromMap(doc));
      }
    } catch (e) {
      print("Error home: $e");
    } finally {
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> addProduct(Product product) async {
    setLoading(true);
    final docRef = await FirebaseFirestore.instance
        .collection('products')
        .add(product.toMap());
    _products
        .add(Product(id: product.id, name: product.name, price: product.price));

    notifyListeners();
    setLoading(false);
  }

  Future<void> updateProduct(Product product) async {
    setLoading(true);

    await FirebaseFirestore.instance
        .collection('products')
        .doc(product.id)
        .update({'name': product.name, 'price': product.price});
    final index = _products.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      _products[index] =
          Product(id: product.id, name: product.name, price: product.price);
    }

    notifyListeners();
    setLoading(false);
  }

  Future<void> deleteProduct(String id) async {
    setLoading(true);
    await FirebaseFirestore.instance.collection('products').doc(id).delete();
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
    setLoading(false);
  }
}
