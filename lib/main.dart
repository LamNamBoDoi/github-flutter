import 'package:firebase/firebase_options.dart';
import 'package:firebase/word_header.dart';
import 'package:firebase/word_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Column(
            children: [
              WordHeader(),
              Expanded(child: WordPage()),
            ],
          )),
    );
  }
}
