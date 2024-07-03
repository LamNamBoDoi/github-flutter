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
    // đảm bảo notify được gọi sau khi widget được build hoàn tất
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
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
      setLoading(false);
    }
  }

  Future<void> addProduct(Product product) async {
    setLoading(true);
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('products')
          .add(product.toMap());
      _products.add(
          Product(id: product.id, name: product.name, price: product.price));
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> updateProduct(Product product) async {
    setLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      String? idDoc;
      for (DocumentSnapshot doc in snapshot.docs) {
        if (Product.fromMap(doc).id == product.id) {
          idDoc = doc.id;
          break;
        }
      }
      await FirebaseFirestore.instance
          .collection('products')
          .doc(idDoc)
          .update({'name': product.name, 'price': product.price});
      final index = _products.indexWhere((element) => element.id == product.id);
      if (index != -1) {
        _products[index] =
            Product(id: product.id, name: product.name, price: product.price);
      }
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteProduct(String id) async {
    setLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      String? idDoc;
      for (DocumentSnapshot doc in snapshot.docs) {
        if (Product.fromMap(doc).id == id) {
          idDoc = doc.id;
          break;
        }
      }

      await FirebaseFirestore.instance
          .collection('products')
          .doc(idDoc)
          .delete();
      print(id);
      _products.removeWhere((element) => element.id == id);
    } catch (e) {
      print(e);
    } finally {
      setLoading(false);
    }
  }
}
