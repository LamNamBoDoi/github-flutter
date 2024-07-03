import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/data/cart_model.dart';
import 'package:firebase/data/order_model.dart';
import 'package:firebase/providers/carts_provider.dart';
import 'package:firebase/providers/order_provider.dart';
import 'package:firebase/providers/products_provider.dart';
import 'package:firebase/view/widgets/container.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: homescafold_color,
        elevation: 0,
        title: const Center(
            child: Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        )),
        actions: [
          Center(
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
          const SizedBox(
            width: 25,
          )
        ],
      ),
      body: Consumer2<CartsProvider, OrderProvider>(
        builder: (context, cartProvider, orderProvider, child) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 75),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: cartProvider.carts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cart = cartProvider.carts[index];
                            return Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 164, 121, 105),
                                ),
                                child: ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset('assets/bubble-tea.png'),
                                  ),
                                  title: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(cart.name,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                    cart.price.toString() + 'đ',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Size: ' +
                                                          cart.size.toString() +
                                                          ', ' +
                                                          "Ice: " +
                                                          cart.ice.toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black87,
                                                        fontSize: 15,
                                                      )),
                                                  Text(
                                                    'x' +
                                                        cart.quantity
                                                            .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      _showDialog(
                                                          context, cart);
                                                    },
                                                    child: const Row(
                                                      children: [
                                                        Icon(Icons
                                                            .edit_note_outlined),
                                                        Text(' Edit')
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 90,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 2),
                                                          ),
                                                          child: Flex(
                                                            direction:
                                                                Axis.horizontal,
                                                            children: [
                                                              Flexible(
                                                                  flex: 1,
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      if (cart.quantity !=
                                                                              null &&
                                                                          cart.quantity! >
                                                                              1) {
                                                                        cart.quantity =
                                                                            cart.quantity! -
                                                                                1;
                                                                        cartProvider.updateCart(
                                                                            cart:
                                                                                cart,
                                                                            quantity:
                                                                                cart.quantity);
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      color:
                                                                          button_color,
                                                                      height:
                                                                          100,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color: cart.quantity! > 1
                                                                              ? Colors.white
                                                                              : Colors.white38,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )),
                                                              Flexible(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .white,
                                                                  height: 100,
                                                                  child: Center(
                                                                      child: Text(
                                                                          '${cart.quantity}',
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20))),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                flex: 1,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    try {
                                                                      cart.quantity =
                                                                          cart.quantity! +
                                                                              1;
                                                                      cartProvider.updateCart(
                                                                          cart:
                                                                              cart,
                                                                          quantity:
                                                                              cart.quantity);
                                                                    } catch (e) {
                                                                      print(cart
                                                                          .quantity
                                                                          .runtimeType);
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    color:
                                                                        button_color,
                                                                    height: 100,
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        InkWell(
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  button_color,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: const Icon(Icons
                                                                .delete_outline),
                                                          ),
                                                          onTap: () async {
                                                            await cartProvider
                                                                .deleteCart(
                                                                    cart.id)
                                                                .then((value) {
                                                              showToast(
                                                                  message:
                                                                      'Cart is deleted');
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          })),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                height: 70,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: authcolor),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total price: ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              cartProvider.totalPrice().toString() + 'đ',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            List<Cart> carts = cartProvider.carts;
                            double totalPrice = cartProvider.totalPrice() ?? 0;
                            await orderProvider
                                .addOrder(OrderModel(
                                    id: uuid.v4(),
                                    carts: carts,
                                    price: totalPrice))
                                .then((value) {
                              cartProvider.clearCarts();
                            });

                            Navigator.pushNamed(context, '/listorderscreen');
                          },
                          child: container(
                              text: 'Add order',
                              color: button_color,
                              width: 120,
                              height: 50),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                child: (orderProvider.isLoading || cartProvider.isLoading)
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(button_color),
                        ),
                      )
                    : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, Cart cart) {
    showDialog(
        context: context,
        builder: (context) {
          int _selectedButtonSizeIndex = -1;
          int _selectedButtonIceIndex = -1;
          double price = cart.price;
          double priceEdit = 0;

          final products =
              Provider.of<ProductsProvider>(context).products.first;
          for (String size in products.size) {
            if (cart.size == size) {
              _selectedButtonSizeIndex = products.size.indexOf(size);
            }
          }
          for (String ice in products.ice) {
            if (cart.ice == ice) {
              _selectedButtonIceIndex = products.ice.indexOf(ice);
            }
          }
          if (_selectedButtonSizeIndex == 0)
            priceEdit = price + 5000;
          else if (_selectedButtonSizeIndex == 1)
            priceEdit = price;
          else
            priceEdit = price - 5000;

          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: const Center(
              child: Text('Edit cart'),
            ),
            content: StatefulBuilder(builder: (context, setState) {
              return Container(
                height: 100,
                width: 150,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Size',
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 50,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: products.size.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String size = products.size[index];

                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedButtonSizeIndex = index;
                                          if (index == 0)
                                            price = (priceEdit - 5000)
                                                .ceilToDouble();
                                          else if (index == 2)
                                            price = (priceEdit + 5000)
                                                .ceilToDouble();
                                          else
                                            price = priceEdit;
                                        });
                                      },
                                      child: container(
                                          text: size,
                                          color:
                                              _selectedButtonSizeIndex == index
                                                  ? button_color
                                                  : authcolor));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Ice',
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: 50,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: products.ice.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final String ice = products.ice[index];

                                  return InkWell(
                                      onTap: () {
                                        setState(() {
                                          _selectedButtonIceIndex = index;
                                        });
                                      },
                                      child: container(
                                          text: ice,
                                          color:
                                              _selectedButtonIceIndex == index
                                                  ? button_color
                                                  : authcolor));
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            actions: [
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: container(
                          text: 'Cance', color: button_color, height: 50),
                    ),
                    InkWell(
                      onTap: () async => await Provider.of<CartsProvider>(
                              context,
                              listen: false)
                          .updateCart(
                              cart: Cart(
                                  id: cart.id,
                                  name: cart.name,
                                  price: price,
                                  quantity: cart.quantity,
                                  size: products.size[_selectedButtonSizeIndex],
                                  ice: products.ice[_selectedButtonIceIndex]))
                          .then((value) {
                        Navigator.of(context).pop();
                        showToast(message: 'Edited successfully');
                      }),
                      child: container(
                          text: 'Ok', color: button_color, height: 50),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
