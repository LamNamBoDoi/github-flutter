import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/StoryData.dart';
import 'package:flutter_application_1/screent/Tabs/HomeTabs/StoryScreent.dart';

Widget MyStory(StoryData story, BuildContext context) {
  return Container(
    width: 90,
    height: 160,
    child: Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoryScreen(
                              story: story,
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  story.story,
                  width: 90,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 115),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                          colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        story.avatar,
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          story.userName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
        )
      ],
    ),
  );
}
