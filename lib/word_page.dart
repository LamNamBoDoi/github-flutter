import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebasestore.dart';
import 'package:flutter/material.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  final words = FirebaseStore();
  var tiengAnhController = TextEditingController();
  var tiengVietController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: words.words.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return ListTile(
                title: Row(
                  children: [
                    Text((document.data()! as Map)['tieng_anh'].toString()),
                    SizedBox(
                      width: 40,
                    ),
                    Text((document.data()! as Map)['tieng_viet'].toString()),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                        child: Icon(Icons.edit),
                        onPressed: () {
                          tiengAnhController.text =
                              (document.data()! as Map)['tieng_anh'].toString();
                          tiengVietController.text =
                              (document.data()! as Map)['tieng_viet']
                                  .toString();

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Update'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                          controller: tiengAnhController,
                                          decoration: InputDecoration(
                                            label: Text('Tieng Anh'),
                                          )),
                                      TextFormField(
                                          controller: tiengVietController,
                                          decoration: InputDecoration(
                                            label: Text('Tieng Viet'),
                                          )),
                                    ],
                                  ),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                        child: Icon(Icons.edit),
                                        onPressed: () {
                                          words.updateWord(
                                              document.id,
                                              tiengAnhController.text,
                                              tiengVietController.text);

                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )
                                  ],
                                );
                              });
                        }),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                      child: Icon(Icons.delete),
                      onPressed: () {
                        words.deleteWord(document.id);
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        } else {
          return Text('ko co gi');
        }
      },
    );
  }
}
