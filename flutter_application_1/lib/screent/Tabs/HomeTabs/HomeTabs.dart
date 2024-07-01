import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/CommentData.dart';
import 'package:flutter_application_1/data/PostData.dart';
import 'package:flutter_application_1/data/StoryData.dart';
import 'package:flutter_application_1/screent/Tabs/Post.dart';
import 'package:flutter_application_1/widget/storyWidget.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
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

  final List<CommentElement> comments2 = [
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
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/anhnen.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Text(
                        "What's on your mind, Sabhat?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF999999)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset(
                        'assets/image.png',
                        width: 24,
                        color: Color(0xFF999999),
                        height: 21,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.search_outlined,
                  size: 18,
                  color: Color(0xFF999999),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF9C50F).withOpacity(0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/clapper.png',
                      width: 21,
                      height: 19,
                      color: Color(0xFFF9C50F),
                    ),
                    const Text(
                      'Reels',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF9C50F)),
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF44C041).withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/video-call.png',
                      width: 21,
                      height: 19,
                      color: Colors.green,
                    ),
                    const Text(
                      'Room',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF44C041)),
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF85900).withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/group.png',
                      width: 21,
                      height: 19,
                      color: Colors.red,
                    ),
                    const Text(
                      'Group',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF85900)),
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF486BE5).withOpacity(0.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/videolive.png',
                      width: 21,
                      height: 19,
                      color: Colors.blue,
                    ),
                    const Text(
                      'Live',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF486BE5)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: 90,
              height: 160,
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/anhnen.jpg',
                          width: 90,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF384CFF)),
                            margin: EdgeInsets.only(top: 115),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MyStory(
                StoryData(
                    userName: 'Cristiano Ronaldo',
                    avatar: 'assets/ronaldoavatar.jpg',
                    story: 'assets/ronaldo.jpg',
                    time: '1h',
                    music: 'Siuuuu'),
                context),
            SizedBox(
              width: 5,
            ),
            MyStory(
                StoryData(
                    userName: 'Leo Messi',
                    avatar: 'assets/messiavatar.jpg',
                    story: 'assets/messi.jpg',
                    time: '1h',
                    music: 'Siuuuu'),
                context),
            SizedBox(
              width: 5,
            ),
            MyStory(
                StoryData(
                    userName: 'Bear',
                    avatar: 'assets/threebearavatar.png',
                    story: 'assets/threebear.jpg',
                    time: '1h',
                    music: 'Siuuuu'),
                context),
            SizedBox(
              width: 5,
            ),
            MyStory(
                StoryData(
                    userName: 'Luffy',
                    avatar: 'assets/onepiece.jpg',
                    story: 'assets/luffy.jpg',
                    time: '1h',
                    music: 'Siuuuu'),
                context),
            SizedBox(
              width: 10,
            )
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        FriendPost(
          postData: PostData(
            avatar: 'assets/ronaldoavatar.jpg',
            text1: 'Cristiano Ronaldo',
            text2: 'is with',
            text3: 'Georgina Rodríguez',
            textTime: '1 h',
            textAddress: 'Maha',
            image: 'assets/familyronaldo.jpg',
            iconStatus: 'assets/earth.png',
            caption: 'Very beautiful..!! \u2764 \u{1F60D} ',
            textLikeBy: 'Sachin Kamble and 155 others',
            textComment: comments1.length.toString(),
          ),
          comments: comments1,
        ),
        FriendPost(
          postData: PostData(
            avatar: 'assets/messiavatar.jpg',
            text1: 'Leo Messi',
            text2: 'is with',
            text3: 'Mahesh Joshi',
            textTime: '1 h',
            textAddress: 'Maha',
            image: 'assets/images1.jpg',
            iconStatus: 'assets/earth.png',
            caption: 'Old is Gold..!! \u2764 \u{1F60D} ',
            textLikeBy: 'Sachin Kamble and 155 others',
            textComment: comments1.length.toString(),
          ),
          comments: comments1,
        ),
      ],
    );
  }
}
