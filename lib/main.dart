import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/settings.dart';
import 'package:hello_world/models/counter.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MySettings()),
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDark
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Provider'),
          actions: [
            Switch(
              value: context.watch<MySettings>().isDark,
              onChanged: (newValue) {
                //context.read<MySettings>().setBrightness(newValue);
                Provider.of<MySettings>(context, listen: false)
                    .setBrightness(newValue);
              },
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              context.watch<Counter>().myValue.toString(),
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<Counter>().add();
          },
          child: Icon(Icons.add),
        ));
  }
}
