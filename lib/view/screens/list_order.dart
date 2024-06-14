import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/providers/order_provider.dart';
import 'package:firebase/view/widgets/container.dart';
import 'package:firebase/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({super.key});

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  @override
  void initState() {
    super.initState();
    Provider.of<OrderProvider>(context, listen: false).fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: homescafold_color,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          'List Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        )),
        actions: [
          Row(
            children: [
              Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
              Text(
                ': ' +
                    Provider.of<OrderProvider>(context)
                        .orders
                        .length
                        .toString(),
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, child) => Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: orderProvider.orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final order = orderProvider.orders[index];
                          final carts = order.carts;
                          return Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 164, 121, 105),
                            ),
                            child: ListTile(
                                title: Column(children: [
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: carts.length,
                                  itemBuilder:
                                      (BuildContext context, int subIndex) {
                                    final cart = carts[subIndex];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            Color.fromARGB(255, 178, 157, 150),
                                      ),
                                      child: ListTile(
                                        title: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Image.asset(
                                                    'assets/bubble-tea.png'),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(cart.name,
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        Text(
                                                          cart.price
                                                                  .toString() +
                                                              'đ',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                                'Size: ' +
                                                                    cart.size
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 15,
                                                                )),
                                                            Text(
                                                                "Ice: " +
                                                                    cart.ice
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 15,
                                                                )),
                                                          ],
                                                        ),
                                                        Text(
                                                          'x' +
                                                              cart.quantity
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  container(
                                      text: 'Total price: ' +
                                          order.price.toString() +
                                          'đ',
                                      color: button_color,
                                      width: 120,
                                      height: 60),
                                  InkWell(
                                    onTap: () =>
                                        orderProvider.deleteOrder(order.id),
                                    child: Icon(Icons.delete_outline),
                                  )
                                ],
                              )
                            ])),
                          );
                        }))
              ],
            ),
            Positioned(
                child: orderProvider.isLoading
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
}
