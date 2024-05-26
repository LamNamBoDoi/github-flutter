import 'dart:io' as io;

import 'package:firebase/cart_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cart.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("""CREATE TABLE cart(
        id INTEGER PRIMARY KEY,
        productId VARCHAR UNIQUE,
        productName TEXT,
        initialPrice INTEGER, 
        productPrice INTEGER, 
        quantity INTEGER, 
        unitTag TEXT , 
        image TEXT 
      )""");
    });
  }

  Future<Cart> insert(Cart cart) async {
    final db = await database;
    var res = await db?.insert(
      'cart',
      cart.toMap(),
    );
    return cart;
  }

  Future<List<Cart>> getAllCart() async {
    final db = await database;
    var res = await db!.query('cart');
    List<Cart> list =
        res.isNotEmpty ? res.map((e) => Cart.fromMap(e)).toList() : [];
    return list;
  }

  Future<int> delete(int id) async {
    var db = await database;
    return db!.delete('cart', where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(Cart cart) async {
    final db = await database;
    return await db!
        .update('cart', cart.toMap(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
