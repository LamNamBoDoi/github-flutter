import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/data/product_model.dart';
import 'package:firebase/providers/order_provider.dart';
import 'package:firebase/providers/products_provider.dart';
import 'package:firebase/view/widgets/drawer_widget.dart';
import 'package:firebase/view/widgets/form_container_widget.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EditMenu extends StatefulWidget {
  const EditMenu({super.key});

  @override
  State<EditMenu> createState() => _EditMenuState();
}

class _EditMenuState extends State<EditMenu> {
  var uuid = Uuid();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: homescafold_color,
        elevation: 0,
        title: const Center(
            child: Text(
          'Edit menu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        )),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
              Text(
                ': ' +
                    Provider.of<ProductsProvider>(context)
                        .products
                        .length
                        .toString(),
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: homescafold_color,
      body:
          // var provider = ProductsProvider();
          // provider.fetchProducts();
          Container(
        margin: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      FormContainerWidget(
                          controller: nameController,
                          isPassword: false,
                          labelText: 'Name'),
                      const SizedBox(
                        height: 5,
                      ),
                      FormContainerWidget(
                          controller: priceController,
                          isPassword: false,
                          labelText: 'Price'),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          if (nameController.text == '' ||
                              priceController.text == '') {
                            showToast(message: "Don't add");
                          } else {
                            double price = double.parse(priceController.text);
                            await Provider.of<ProductsProvider>(context,
                                    listen: false)
                                .addProduct(Product(
                                    id: uuid.v4(),
                                    name: nameController.text,
                                    price: price == price.toInt()
                                        ? price.ceilToDouble()
                                        : price));
                            nameController.text = '';
                            priceController.text = '';
                            showToast(message: 'Add successfully');
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 232, 99, 89),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<ProductsProvider>(
                  builder: (context, productProvider, child) => Expanded(
                      child: ListView.builder(
                          itemCount: productProvider.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = productProvider.products[index];
                            return Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 164, 121, 105),
                              ),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child:
                                          Image.asset('assets/bubble-tea.png'),
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(product.name,
                                              style: const TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            product.price.toString() + 'đ',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        final nameControllerDialog =
                                            TextEditingController();
                                        final priceControllerDialog =
                                            TextEditingController();
                                        nameControllerDialog.text =
                                            product.name;
                                        priceControllerDialog.text =
                                            product.price.toString();

                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                ),
                                                title: Text('Update'),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    FormContainerWidget(
                                                        controller:
                                                            nameControllerDialog,
                                                        isPassword: false,
                                                        labelText: 'Name'),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    FormContainerWidget(
                                                        controller:
                                                            priceControllerDialog,
                                                        isPassword: false,
                                                        labelText: 'Price'),
                                                  ],
                                                ),
                                                actions: [
                                                  Center(
                                                    child: InkWell(
                                                        child: Container(
                                                            width: 100,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color:
                                                                    button_color),
                                                            child: const Center(
                                                                child: Text(
                                                              'Ok',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ))),
                                                        onTap: () async {
                                                          if (product.name ==
                                                                  nameControllerDialog
                                                                      .text &&
                                                              product.price
                                                                      .toString() ==
                                                                  priceControllerDialog
                                                                      .text) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          } else {
                                                            double price =
                                                                double.parse(
                                                                    priceControllerDialog
                                                                        .text);
                                                            await productProvider.updateProduct(Product(
                                                                id: product.id,
                                                                name:
                                                                    nameControllerDialog
                                                                        .text,
                                                                price: price ==
                                                                        price
                                                                            .toInt()
                                                                    ? price
                                                                        .ceilToDouble()
                                                                    : price));

                                                            showToast(
                                                                message:
                                                                    'Update successly');

                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        }),
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      child: const Icon(Icons.edit),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await productProvider
                                            .deleteProduct(product.id);
                                        showToast(message: 'Delete successly');
                                      },
                                      child: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ),
              ],
            ),
            Positioned(
              child: Consumer<ProductsProvider>(
                  builder: (context, productsProvider, child) {
                if (productsProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(button_color),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
