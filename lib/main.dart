import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      home: Home(),
    ));

class Counter extends GetxController {
  RxInt count = 0.obs;

  void add() {
    count++;
  }
}

class Home extends StatelessWidget {
  final counter = Get.put(Counter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(() => Text(
                '${counter.count}',
                style: TextStyle(fontSize: 50, color: Colors.red),
              )),
          ElevatedButton(
              onPressed: () {
                Get.to(OtherScreen());
              },
              child: Text('Goto Other Screen')),
          ElevatedButton(
              onPressed: () {
                Get.to(ThirdScreen());
              },
              child: Text('Goto Third Screen'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  final Counter otherCounter = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() => Text(
              '${otherCounter.count}',
              style: TextStyle(fontSize: 50, color: Colors.red),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          otherCounter.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Show SnackBar'),
              onPressed: () {
                Get.snackbar('Hi', 'Bla bal bla....');
              },
            ),
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ));
  }
}
