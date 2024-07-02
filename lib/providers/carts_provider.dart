import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/cart_model.dart';
import 'package:flutter/material.dart';

class CartsProvider with ChangeNotifier {
  final List<Cart> _carts = [];

  List<Cart> get carts => _carts;
  bool _isLoading = false;
  get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchCarts() async {
    setLoading(true);
    final snapshot = await FirebaseFirestore.instance.collection('carts').get();
    print('cart: ' + snapshot.docs.length.toString());
    _carts.clear();
    for (DocumentSnapshot doc in snapshot.docs) {
      _carts.add(Cart.fromMap(doc));
    }

    notifyListeners();
    setLoading(false);
  }

  Future<void> addCart(Cart cart) async {
    setLoading(true);
    final docRef =
        await FirebaseFirestore.instance.collection('carts').add(cart.toMap());
    _carts.add(Cart(
        id: cart.id,
        name: cart.name,
        price: cart.price,
        size: cart.size,
        ice: cart.ice,
        quantity: cart.quantity));

    notifyListeners();
    setLoading(false);
  }

  Future<void> updateCart({required Cart cart, int? quantity}) async {
    setLoading(true);
    try {
      final docRef =
          FirebaseFirestore.instance.collection('carts').doc(cart.id);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          'name': cart.name,
          'price': cart.price,
          'size': cart.size,
          'ice': cart.ice,
          'quantity': quantity ?? cart.quantity
        });
      }

      final index = _carts.indexWhere((element) => element.id == cart.id);
      if (index != -1) {
        _carts[index] = Cart(
            id: cart.id,
            name: cart.name,
            price: cart.price,
            size: cart.size,
            ice: cart.ice,
            quantity: quantity ?? cart.quantity);
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
    setLoading(false);
  }

  Future<void> deleteCart(String id) async {
    setLoading(true);
    await FirebaseFirestore.instance.collection('carts').doc(id).delete();
    _carts.removeWhere((element) => element.id == id);
    notifyListeners();
    setLoading(false);
  }

  double? totalPrice() {
    double totalPrice = 0;
    for (Cart cart in carts) {
      totalPrice = totalPrice + cart.price * cart.quantity!;
    }
    return totalPrice;
  }

  Future<void> clearCarts() async {
    carts.clear();
    await FirebaseFirestore.instance.collection('carts').get().then((value) {
      for (DocumentSnapshot doc in value.docs) {
        doc.reference.delete();
      }
    });
    notifyListeners();
  }
}
