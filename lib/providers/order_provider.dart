import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/data/order_model.dart';
import 'package:firebase/providers/carts_provider.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = [];
  final cartProvider = CartsProvider();
  List<OrderModel> get orders => _orders;
  bool _isLoading = false;
  get isLoading => _isLoading;
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchOrders() async {
    setLoading(true);
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      print("order: ${snapshot.docs.length}");
      _orders.clear();
      for (DocumentSnapshot doc in snapshot.docs) {
        _orders.add(OrderModel.fromMap(doc));
      }
    } catch (e) {
      print('orders: ' + e.toString());
    } finally {
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> addOrder(OrderModel order) async {
    setLoading(true);
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('orders')
          .add(order.toMap());
      _orders.add(
          OrderModel(id: order.id, carts: order.carts, price: order.price));

      print(order.carts.first.name);
    } catch (e) {
      print('order error: ' + e.toString());
    } finally {
      notifyListeners();
      setLoading(false);
    }
  }

  Future<void> updateOrder(OrderModel order) async {
    setLoading(true);
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(order.id)
        .update({'carts': order.carts, 'price': order.price});
    final index = _orders.indexWhere((element) => element.id == order.id);
    if (index != -1) {
      _orders[index] =
          OrderModel(id: order.id, carts: order.carts, price: order.price);
    }
    notifyListeners();
    setLoading(false);
  }

  Future<void> deleteOrder(String id) async {
    setLoading(true);
    await FirebaseFirestore.instance.collection('orders').doc(id).delete();
    _orders.removeWhere((element) => element.id == id);
    notifyListeners();
    setLoading(false);
  }
}
