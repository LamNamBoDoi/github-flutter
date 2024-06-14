import 'package:firebase/providers/carts_provider.dart';
import 'package:firebase/providers/order_provider.dart';
import 'package:firebase/providers/products_provider.dart';
import 'package:firebase/view/screens/cart_screen.dart';
import 'package:firebase/view/screens/customize_screen.dart';
import 'package:firebase/view/screens/edit_menu.dart';
import 'package:firebase/view/screens/home_screen.dart';
import 'package:firebase/view/screens/list_order.dart';
import 'package:firebase/view/screens/login_screen.dart';
import 'package:firebase/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(
            create: (context) => ProductsProvider()..fetchProducts()),
        ChangeNotifierProvider<CartsProvider>(
            create: (context) => CartsProvider()..fetchCarts()),
        ChangeNotifierProvider<OrderProvider>(
            create: (context) => OrderProvider()..fetchOrders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/': (context) => HomePage(),
          '/login': (context) => LoginScreen(),
          '/editmenu': (context) => EditMenu(),
          '/signup': (context) => SignUpScreen(),
          '/cartscreen': (context) => CartScreen(),
          '/customizescreen': (context) => CustomizeScreen(),
          '/listorderscreen': (context) => ListOrder(),
        },
      ),
    );
  }
}
