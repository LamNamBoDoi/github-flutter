import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MySettings(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MySettings extends ChangeNotifier {
  String text = 'Done';
  Color color = Colors.red;

  void changText() {
    if (text == 'Hello') {
      text = 'World';
    } else {
      text = 'Hello';
    }
    notifyListeners();
  }

  void changColor() {
    if (color == Colors.red) {
      color = Colors.blue;
    } else {
      color = Colors.red;
    }
    notifyListeners();
  }

  set newColor(Color newColor) {
    color = newColor;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MySettings>(builder: (context, mySettings, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Provider Demo'),
          backgroundColor: mySettings.color,
        ),
        drawer: Drawer(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    mySettings.changColor();
                    Navigator.pop(context);
                  },
                  child: Text('Chang Color')),
              ElevatedButton(
                  onPressed: () {
                    mySettings.changText();
                    Navigator.pop(context);
                  },
                  child: Text('Chang Text')),
              ElevatedButton(
                onPressed: () {
                  mySettings.newColor = Colors.green;
                  Navigator.pop(context);
                },
                child: Text('Change Color to Green'),
              ),
            ]),
          ),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                mySettings.changText();
                mySettings.changColor();
              },
              child: Text('Change Text'),
              style: ElevatedButton.styleFrom(
                primary: mySettings.color,
              ),
            ),
            Text('${mySettings.text}')
          ],
        )),
      );
    });
  }
}
