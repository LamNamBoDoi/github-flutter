import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/data/cart_model.dart';
import 'package:firebase/data/product_model.dart';
import 'package:firebase/providers/carts_provider.dart';
import 'package:firebase/view/widgets/container.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomizeScreen extends StatefulWidget {
  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  int count = 1;
  void increseCount() {
    setState(() {
      count++;
      print(count);
    });
  }

  double price = 0;

  void decreseCount() {
    setState(() {
      count--;
      print(count);
    });
  }

  int _selectedButtonSizeIndex = -1;

  void _onButtonSizeTap(int index, double priceProduct) {
    setState(() {
      _selectedButtonSizeIndex = index;
      if (index == 0)
        price = (priceProduct - priceProduct * 0.1).ceilToDouble();
      else if (index == 2)
        price = (priceProduct + priceProduct * 0.1).ceilToDouble();
      else
        price = priceProduct;
    });
  }

  int _selectedButtonIceIndex = -1;

  void _onButtonIceTap(int index) {
    setState(() {
      _selectedButtonIceIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    final double screenWidth = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartsProvider>(context);

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: homescafold_color,
            elevation: 0,
            title: const Text(
              'Customize Order',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            )),
        body: Stack(
          children: [
            Container(),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                color: authcolor,
                width: screenWidth,
                height: 200,
                child: Image.asset(
                  'assets/bubble-tea.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Positioned(
              top: 190, // Điều chỉnh vị trí top để container không bị che khuất
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Màu của bóng mờ
                      spreadRadius: 5, // Bán kính lan tỏa của bóng
                      blurRadius: 7, // Độ mờ của bóng
                      offset: Offset(0, 3), // Vị trí của bóng (x, y)
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(product.name,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  product.price.toString() + 'đ',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Flexible(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          if (count > 1)
                                            decreseCount();
                                          else {
                                            return;
                                          }
                                        },
                                        child: Container(
                                          color: button_color,
                                          height: 100,
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: count > 1
                                                  ? Colors.white
                                                  : Colors.white38,
                                            ),
                                          ),
                                        ),
                                      )),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      color: Colors.white,
                                      height: 100,
                                      child: Center(
                                          child: Text('$count',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20))),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () => increseCount(),
                                      child: Container(
                                        color: button_color,
                                        height: 100,
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Customize',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                                        itemCount: product.size.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String size =
                                              product.size[index];
                                          return InkWell(
                                              onTap: () {
                                                _onButtonSizeTap(
                                                    index, product.price);
                                              },
                                              child: container(
                                                  text: size,
                                                  color:
                                                      _selectedButtonSizeIndex ==
                                                              index
                                                          ? button_color
                                                          : authcolor));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
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
                                        itemCount: product.ice.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final String ice = product.ice[index];
                                          return InkWell(
                                              onTap: () {
                                                _onButtonIceTap(index);
                                              },
                                              child: container(
                                                  text: ice,
                                                  color:
                                                      _selectedButtonIceIndex ==
                                                              index
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
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Total price:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  (price * count).toString() + 'đ',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if (_selectedButtonIceIndex == -1 ||
                                    _selectedButtonSizeIndex == -1) {
                                  showToast(message: 'Please choose size, ice');
                                } else {
                                  cart
                                      .addCart(Cart(
                                          id: product.id,
                                          name: product.name,
                                          price: price,
                                          quantity: count,
                                          size: product
                                              .size[_selectedButtonSizeIndex],
                                          ice: product
                                              .ice[_selectedButtonIceIndex]))
                                      .then((value) {
                                    showToast(
                                        message: 'Product is added to cart');
                                    Navigator.of(context).pop();
                                  }).onError((error, stackTrace) {
                                    showToast(
                                        message:
                                            'Product is already added in cart');
                                  });
                                }
                              },
                              child: container(
                                  text: 'Add cart',
                                  color: button_color,
                                  height: 50,
                                  width: 100),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Consumer<CartsProvider>(
                  builder: (context, cartProvider, child) {
                if (cartProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(button_color),
                    ),
                  );
                }
                return SizedBox.shrink();
              }),
            ),
          ],
        ));
  }
}
