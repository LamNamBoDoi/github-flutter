import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/CommentData.dart';
import 'package:flutter_application_1/data/PostData.dart';
import 'package:flutter_application_1/screent/Tabs/Post.dart';

class WatchTabs extends StatefulWidget {
  const WatchTabs({super.key});

  @override
  State<WatchTabs> createState() => _WatchTabsState();
}

class _WatchTabsState extends State<WatchTabs> {
  List<String> list = ['For you', 'Live', 'Music', 'Gaming', 'Following'];
  int select = 0;
  final List<CommentElement> comments1 = [
    CommentElement(
        name: 'Amir Shenoy',
        comment: 'Beautiful place.',
        avatar: 'assets/anhnen.jpg',
        time: '1 h'),
    CommentElement(
        name: 'Amir Shenoy',
        comment: 'Beautiful place.',
        avatar: 'assets/anhnen.jpg',
        time: '1 h'),
    CommentElement(
        name: 'Amir Shenoy',
        comment: 'Beautiful place.',
        avatar: 'assets/anhnen.jpg',
        time: '1 h'),
    CommentElement(
        name: 'Amir Shenoy',
        comment: 'Beautiful place.',
        avatar: 'assets/anhnen.jpg',
        time: '1 h'),
  ];
  @override
  Widget build(BuildContext context) {
    double widthMax = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          // Watch list
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            width: widthMax,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    'Watch',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF384CFF), Color(0xFF00A3FF)]),
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    select = index;
                                  });
                                },
                                child: Container(
                                  width: 75,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Text(
                                          list[index],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      if (select == index)
                                        Container(
                                          width: 20,
                                          height: 1,
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      width: 1,
                                                      color: Colors.white))),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FriendPost(
            postData: PostData(
              avatar: 'assets/messiavatar.jpg',
              text1: 'Leo Messi',
              text2: '',
              text3: '',
              textTime: '1 h',
              textAddress: '',
              image: 'assets/images1.jpg',
              iconStatus: '',
              caption: 'Old is Gold..!! \u2764 \u{1F60D} ',
              textLikeBy: 'Sachin Kamble and 155 others',
              textComment: comments1.length.toString(),
            ),
            watchPost: true,
            comments: comments1,
          ),
          FriendPost(
            postData: PostData(
              avatar: 'assets/messiavatar.jpg',
              text1: 'Leo Messi',
              text2: '',
              text3: '',
              textTime: '1 h',
              textAddress: '',
              image: 'assets/images1.jpg',
              iconStatus: 'assets/earth.png',
              caption: 'Old is Gold..!! \u2764 \u{1F60D} ',
              textLikeBy: 'Sachin Kamble and 155 others',
              textComment: comments1.length.toString(),
            ),
            watchPost: true,
            comments: comments1,
          ),
        ],
      ),
    );
  }
}
