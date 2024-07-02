import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/providers/carts_provider.dart';
import 'package:firebase/providers/products_provider.dart';
import 'package:firebase/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: homescafold_color,
      appBar: AppBar(
        backgroundColor: homescafold_color,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          color: Colors.black,
        ),
        title: const Center(
            child: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        )),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cartscreen');
            },
            child: Center(
              child: badges.Badge(
                badgeContent:
                    Consumer<CartsProvider>(builder: (context, value, child) {
                  return Text(
                    value.carts.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                }),
                animationDuration: const Duration(milliseconds: 300),
                animationType: badges.BadgeAnimationType.slide,
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Consumer<ProductsProvider>(
        builder: (context, productProvider, child) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: productProvider.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = productProvider.products[index];
                            return Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 164, 121, 105),
                                ),
                                child: ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                            'assets/bubble-tea.png'),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(product.name,
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              product.price.toString() + 'đ',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  trailing: InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: button_color,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/customizescreen',
                                          arguments: product);
                                    },
                                  ),
                                ));
                          })),
                ],
              ),
            ),
            Positioned(
                child: productProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(button_color),
                        ),
                      )
                    : const SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
