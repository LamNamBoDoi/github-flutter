import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FriendData.dart';

class MessangerChatScreent extends StatefulWidget {
  const MessangerChatScreent({super.key});

  @override
  State<MessangerChatScreent> createState() => _MessangerChatScreentState();
}

class _MessangerChatScreentState extends State<MessangerChatScreent> {
  @override
  Widget build(BuildContext context) {
    FriendData? friendData =
        ModalRoute.of(context)?.settings.arguments as FriendData;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45),
            padding: EdgeInsets.only(top: 54),
            width: MediaQuery.of(context).size.width,
            height: 260,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    friendData.avatar,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  friendData.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    action(icon: Icons.call, nameAction: 'Audio'),
                    action(icon: Icons.videocam, nameAction: 'Video'),
                    action(icon: Icons.person, nameAction: 'Profile'),
                    action(icon: Icons.notifications, nameAction: 'Mute')
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFAAAAAA)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Theme',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Emoji',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Nickname',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Word effects',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFAAAAAA)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More Actions',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Theme',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Emoji',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Nickname',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Word effects',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFAAAAAA)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Block',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Report',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget action({required IconData icon, required String nameAction}) {
    return Container(
      width: 40,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      colors: [Color(0xFF384CFF), Color(0xFF00A3FF)])
                  .createShader(bounds);
            },
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          Text(
            nameAction,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
