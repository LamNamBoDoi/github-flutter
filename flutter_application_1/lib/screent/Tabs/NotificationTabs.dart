import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/NotificationData.dart';

class NotificationTabs extends StatefulWidget {
  const NotificationTabs({super.key});

  @override
  State<NotificationTabs> createState() => _NotificationTabsState();
}

class _NotificationTabsState extends State<NotificationTabs> {
  List<MyNotify> list = [
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
    MyNotify(
        nameFriend: 'Darrell',
        avatarFriend: 'assets/threebearavatar.png',
        notification: 'has a new story up.',
        question: "What's your reaction?",
        time: '2 hours ago'),
  ];

  @override
  Widget build(BuildContext context) {
    double widthMax = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          // Head notification
          Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.4)),
                    child: Icon(Icons.search))
              ],
            ),
          ),

          // Body notification
          Container(
            width: widthMax,
            height: 40,
            padding: EdgeInsets.only(left: 10, top: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF384CFF).withOpacity(0.2),
              Color(0xFF00A3FF).withOpacity(0.2)
            ])),
            child: Text(
              'New',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          notify(myNotify: list[0]),
          notify(myNotify: list[1]),
          notify(myNotify: list[2]),
          notify(myNotify: list[3]),
          notify(myNotify: list[4]),
          notify(myNotify: list[5], watched: true),

          Container(
            width: widthMax,
            height: 40,
            padding: EdgeInsets.only(left: 10, top: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF384CFF).withOpacity(0.1),
              Color(0xFF00A3FF).withOpacity(0.1)
            ])),
            child: Text(
              'Earlier',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          notify(myNotify: list[6], watched: true),
          notify(myNotify: list[7]),
          notify(myNotify: list[8]),
          notify(myNotify: list[9], watched: true),
          notify(myNotify: list[10], watched: true),
          notify(myNotify: list[11], watched: true),
        ],
      ),
    );
  }

  Widget notify({required MyNotify myNotify, bool? watched}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: watched == true
              ? LinearGradient(colors: [
                  Color(0xFF384CFF).withOpacity(0.1),
                  Color(0xFF00A3FF).withOpacity(0.1)
                ])
              : LinearGradient(colors: [
                  Color(0xFF384CFF).withOpacity(0.2),
                  Color(0xFF00A3FF).withOpacity(0.2)
                ])),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                myNotify.avatarFriend,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: myNotify.nameFriend,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  TextSpan(
                      text: ' ' + myNotify.notification,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  TextSpan(
                      text: '\n' + myNotify.question,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black))
                ])),
                Text(myNotify.time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
          const Expanded(
              child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(Icons.more_horiz),
                  )))
        ],
      ),
    );
  }
}
