import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/StoryData.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.story});
  final StoryData story;
  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  double percent = 0.0;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 4), (timer) {
      setState(() {
        percent += 0.001;
        if (percent > 1) {
          _timer.cancel();
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.story.story), fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 15),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: percent,
                  minHeight: 3,
                  color: Color(0xFFDDDDDD),
                  backgroundColor: Color(0xFF999999),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF384CFF),
                                      Color(0xFF00A3FF)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset(
                                  widget.story.avatar,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' ' +
                                    widget.story.userName +
                                    '   ' +
                                    widget.story.time,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.music_note,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    widget.story.music,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFEEEEEE).withOpacity(0.5),
                        ),
                        child: Image.asset(
                          'assets/share.png',
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        width: 180,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                          decoration: const InputDecoration(
                            hintText: 'Send message',
                            hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/likefacebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/heart.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/facelove.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/hahafacebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/surprisedfacebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/sadfacebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          'assets/angryfacebook.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
