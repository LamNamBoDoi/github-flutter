import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/CommentData.dart';
import 'package:flutter_application_1/data/PostData.dart';

import 'package:flutter_application_1/screent/Tabs/Post.dart';
import 'package:flutter_application_1/widget/ButtonSmallWidget.dart';

class PersonalTabs extends StatelessWidget {
  const PersonalTabs({super.key});

  @override
  Widget build(BuildContext context) {
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
    double widthMax = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              // Profile photo
              Stack(
                children: [
                  Container(
                    width: widthMax,
                    height: 250,
                    child: Image.asset(
                      'assets/images1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140),
                    height: 180,
                    width: widthMax,
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/anhnen.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                height: 45,
                width: widthMax,
                child: const Text(
                  'Sanjay Shendy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Text/button for profile
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: widthMax,
                height: 105,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0xFFAAAAAAA)))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        button(
                            text: 'Add to story', width: 150.0, height: 35.0),
                        button(
                            text: 'Edit profile',
                            width: 150.0,
                            height: 35.0,
                            color: Color(0xFFEEEEEE),
                            colorText: Colors.black),
                        Icon(
                          Icons.more_vert,
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 35,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/security.png',
                                fit: BoxFit.cover,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'You locked your profile\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black)),
                            TextSpan(
                                text: 'Learn more',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF384CFF)))
                          ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // Friends count
              Container(
                width: widthMax,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textLinear(text1: 'Posts', text2: '1972'),
                    textLinear(text1: 'Friends', text2: '4843'),
                    textLinear(text1: 'Followers', text2: '1990'),
                    textLinear(text1: 'Following', text2: '1456')
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              // Profile public details
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: widthMax,
                height: 240,
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Color(0xFFAAAAAA))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 25,
                      child: Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Founder and CEO at',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' A to Z company Ltd.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: -40 * 3.14 / 180,
                            child: const Icon(
                              Icons.school,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'Studied Computer Science',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            TextSpan(
                                text: '\nat Havard University',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.home_filled,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'Lives in',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' Mumbai, Maharastra.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: 'From',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' Mumbai, India.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('See your about info',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                    button(
                        text: 'Edit public detail',
                        width: 150.0,
                        height: 25.0,
                        colorText: Colors.black,
                        color: Color(0xFFEEEEEE)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // Profile post 1
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: widthMax,
                height: 70,
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 0.5, color: Color(0xFFAAAAAA))),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '1478 friends posted on your ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            TextSpan(
                                text: 'timeline ',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            TextSpan(
                                text: 'for yuor birthday',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ]),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    button(text: 'See All', width: 100.0, height: 25.0)
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              FriendPost(
                postData: PostData(
                  avatar: 'assets/anhnen.jpg',
                  text1: 'Sanjay Shendy',
                  text2: '',
                  text3: '',
                  textTime: '1 h',
                  textAddress: '',
                  image: 'assets/images1.jpg',
                  iconStatus: 'assets/earth.png',
                  caption:
                      'You never been expected like as your friend can be look as much cute in specific costume, and suddenly if you have seen his picture on Facebook, then probably your comment on photo can be like as. “Cuteness overloaded!”. ',
                  textLikeBy: 'Sachin Kamble and 155 others',
                  textComment: comments1.length.toString(),
                ),
                myPost: true,
                like: 100,
                comments: comments1,
              ),
              FriendPost(
                postData: PostData(
                  avatar: 'assets/anhnen.jpg',
                  text1: 'Sanjay Shendy',
                  text2: '',
                  text3: '',
                  textTime: '1 h',
                  textAddress: '',
                  image: 'assets/images1.jpg',
                  iconStatus: 'assets/earth.png',
                  caption:
                      'You never been expected like as your friend can be look as much cute in specific costume, and suddenly if you have seen his picture on Facebook, then probably your comment on photo can be like as. “Cuteness overloaded!”.',
                  textLikeBy: 'Sachin Kamble and 155 others',
                  textComment: comments2.length.toString(),
                ),
                myPost: true,
                like: 10,
                comments: comments2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget textLinear({required text1, required text2}) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
      ).createShader(bounds);
    },
    child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: text1 + '\n',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          )
        ])),
  );
}
