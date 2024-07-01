import 'package:flutter_application_1/data/FriendData.dart';

class MessangerData {
  FriendData friendData;
  String messangerLast;
  String time;
  bool wachted;
  bool myLast;

  MessangerData({
    required this.friendData,
    required this.messangerLast,
    required this.time,
    required this.wachted,
    required this.myLast,
  });
}
