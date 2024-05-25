import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseStore {
  CollectionReference words = FirebaseFirestore.instance.collection('words');

  Future<void> addWord(String tiengAnh, String tiengViet) {
    return words
        .add({
          'tieng_anh': tiengAnh,
          'tieng_viet': tiengViet,
        })
        .then((value) => print("Word added"))
        .catchError((e) => print("Falied"));
  }

  Future<void> updateWord(String wordId, String tiengAnh, String tiengViet) {
    return words
        .doc(wordId)
        .update({'tieng_anh': tiengAnh, 'tieng_viet': tiengViet})
        .then((value) => print('Word updated'))
        .catchError((e) => print('failed'));
  }

  Future<void> deleteWord(String wordId) {
    return words
        .doc(wordId)
        .delete()
        .then((value) => print('Word deleted'))
        .catchError((e) => print('Failed'));
  }
}
