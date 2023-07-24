import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = 'default';
  Future<String> textFunc() {
    return Future.delayed(Duration(seconds: 2), (() => 'hello'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: textFunc(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                var value = snapshot.data.toString();
                return Text(value);
              } else if (snapshot.hasError) {
                print(snapshot.error);
              }
              return Text('');
            },
          )
        ],
      ),
    );
  }
}
