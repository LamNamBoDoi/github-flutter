import 'package:firebase/firebasestore.dart';
import 'package:flutter/material.dart';

class WordHeader extends StatelessWidget {
  WordHeader({super.key});

  final tiengAnhController = TextEditingController();
  final tiengVietController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: tiengAnhController,
            decoration: InputDecoration(labelText: 'Tieng Anh'),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: tiengVietController,
            decoration: InputDecoration(labelText: 'Tieng Viet'),
          ),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseStore()
                    .addWord(tiengAnhController.text, tiengVietController.text);
                tiengAnhController.text = '';
                tiengVietController.text = '';
              },
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text('Add'),
                ],
              ))
        ],
      ),
    );
  }
}
