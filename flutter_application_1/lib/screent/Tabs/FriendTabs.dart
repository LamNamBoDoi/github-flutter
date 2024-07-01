import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FriendRequest.dart';
import 'package:flutter_application_1/widget/ButtonSmallWidget.dart';

class FriendTabs extends StatefulWidget {
  const FriendTabs({super.key});

  @override
  State<FriendTabs> createState() => _FriendTabsState();
}

class _FriendTabsState extends State<FriendTabs> {
  List<FriendRequest> lists = [
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
    FriendRequest(
        name: 'Kiran Pawar',
        avatar: 'assets/anhnen.jpg',
        mutualFriend: '1',
        timeRequest: '9w'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          // Friends heading
          Container(
            height: 160,
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Friends',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.3)),
                        child: Icon(Icons.search_outlined),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 35,
                  child: Row(
                    children: [
                      button(text: 'Suggestions'),
                      SizedBox(
                        width: 15,
                      ),
                      button(text: 'Your Friends')
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.5,
                  color: Color(0xFFAAAAAA),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: 'Friend request',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: '  440',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.red))
                      ])),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF384CFF)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Friend request
          Expanded(
            child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          lists[index].avatar,
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lists[index].name,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      lists[index].mutualFriend +
                                          ' mutual friend',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF999999)),
                                    )
                                  ],
                                ),
                                Text(
                                  lists[index].timeRequest,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF999999)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                button(
                                  text: 'Confirm',
                                  width: 120.0,
                                ),
                                button(
                                    text: 'Delete',
                                    width: 120.0,
                                    colorText: Colors.black,
                                    color: Color(0xFFEEEEEE))
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
