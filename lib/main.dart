import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hi-Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Hi-Score'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;

  void initSate() {
    super.initState();
    _loadScore();
  }

  void _loadScore() async {
    final scoreData = await SharedPreferences.getInstance();
    setState(() {
      _score = scoreData.getInt('score') ?? 0;
    });
  }

  void _incrementCounter() async {
    final scoreData = await SharedPreferences.getInstance();
    setState(() {
      _score = (scoreData.getInt('score') ?? 0) + 1;
      scoreData.setInt('score', _score);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_score',
            style: TextStyle(fontSize: 50),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _incrementCounter();
        },
      ),
    );
  }
}
