import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CounterProvider(),
    child: MaterialApp(
      home: CounterHome(),
    ),
  ));
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void add() {
    _counter++;
    notifyListeners();
  }
}

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.watch<CounterProvider>().counter.toString(),
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}
