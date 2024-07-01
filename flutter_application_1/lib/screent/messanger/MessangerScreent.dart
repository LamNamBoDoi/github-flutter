import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FriendData.dart';
import 'package:flutter_application_1/data/MessangerData.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessangerScreent extends StatefulWidget {
  const MessangerScreent({super.key});

  @override
  State<MessangerScreent> createState() => _MessangerScreentState();
}

class _MessangerScreentState extends State<MessangerScreent> {
  List<FriendData> listFriend = [];
  List<MessangerData> listMessangerData = [];
  //MessangerData messangerData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listFriend = [
      FriendData(
          name: 'Cristino Ronaldo',
          avatar: 'assets/ronaldoavatar.jpg',
          active: true),
      FriendData(
          name: 'Leo Messi', avatar: 'assets/messiavatar.jpg', active: true),
      FriendData(name: 'Lucy', avatar: 'assets/onepiece.jpg', active: true),
      FriendData(name: 'Bear', avatar: 'assets/threebear.jpg', active: false),
      FriendData(
          name: 'Cristino Ronaldo',
          avatar: 'assets/ronaldoavatar.jpg',
          active: true),
      FriendData(name: 'Lucy', avatar: 'assets/onepiece.jpg', active: false),
      FriendData(name: 'Bear', avatar: 'assets/threebear.jpg', active: true),
    ];

    listMessangerData = [
      MessangerData(
          friendData: listFriend[0],
          messangerLast: 'Okay fine',
          time: '08.36 AM',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[1],
          messangerLast: 'Yes, Thanks!!',
          time: '06:00 AM',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[2],
          messangerLast: 'See you soon',
          time: 'Sat',
          wachted: false,
          myLast: true),
      MessangerData(
          friendData: listFriend[3],
          messangerLast: 'Have a good day',
          time: 'Fri',
          wachted: false,
          myLast: false),
      MessangerData(
          friendData: listFriend[4],
          messangerLast: 'Ok, see you in Tor..',
          time: 'Thu',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[5],
          messangerLast: 'The business plan loo..',
          time: '08.36 AM',
          wachted: true,
          myLast: false),
      MessangerData(
          friendData: listFriend[6],
          messangerLast: 'Okay Thanks',
          time: '08.36 AM',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[0],
          messangerLast: 'Okay fine',
          time: '08.36 AM',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[1],
          messangerLast: 'Yes, Thanks!!',
          time: '06:00 AM',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[2],
          messangerLast: 'See you soon',
          time: 'Sat',
          wachted: false,
          myLast: true),
      MessangerData(
          friendData: listFriend[3],
          messangerLast: 'Have a good day',
          time: 'Fri',
          wachted: false,
          myLast: false),
      MessangerData(
          friendData: listFriend[4],
          messangerLast: 'Ok, see you in Tor..',
          time: 'Thu',
          wachted: true,
          myLast: true),
      MessangerData(
          friendData: listFriend[5],
          messangerLast: 'The business plan loo..',
          time: '08.36 AM',
          wachted: true,
          myLast: false),
      MessangerData(
          friendData: listFriend[6],
          messangerLast: 'Okay Thanks',
          time: '08.36 AM',
          wachted: true,
          myLast: true)
    ];
  }

  Widget build(BuildContext context) {
    double widthMax = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 45),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 55,
                width: widthMax,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/home'),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/anhnen.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Chats',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.3)),
                            child: Icon(Icons.camera_alt),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/newMessanger'),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3)),
                              child: Icon(Icons.note_alt),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              width: widthMax - 95,
                              height: 35,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFEEEEEE).withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Search",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF999999)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFDDDDDD),
                              ),
                              child: const Center(
                                child: Text(
                                  'Unread',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // Messanger live
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 80,
                        width: widthMax,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFEEEEEE)),
                                  child: ShaderMask(
                                      shaderCallback: (Rect bounds) =>
                                          const LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFF384CFF),
                                              Color(0xFF00A3FF),
                                            ],
                                          ).createShader(bounds),
                                      blendMode: BlendMode.srcIn,
                                      child: Container(
                                          child: const Center(
                                              child: Icon(
                                                  Icons.video_camera_front)))),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 50,
                                  child: const Text(
                                    'Create video call',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Row(
                                children: listFriend.map((friend) {
                              return friendWidget(
                                  friendData: friend, haveName: true);
                            }).toList()),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFF006BFF),
                          Color(0xFF00B1FF),
                        ]),
                      ),
                      child: Column(
                        children: listMessangerData
                            .map((messanger) => messangerWidget(
                                messangerData: messanger, context: context))
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 59,
                    ),
                  ],
                ),
              )
            ],
          ),

          // Tab bar
          Positioned(
            height: 60,
            width: widthMax,
            bottom: 0,
            child: Container(
              color: Colors.white.withOpacity(0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF006BFF),
                          Color(0xFF00B1FF),
                        ]).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      'assets/speech-bubble.png',
                      height: 26,
                      width: 26,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 30,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/group.png',
                            fit: BoxFit.cover,
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Color(0xFF36FF00)),
                              child: const Center(
                                child: Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/compass.png',
                      height: 26,
                      width: 26,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget friendWidget({required FriendData friendData, required bool haveName}) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 55,
            height: 55,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        friendData.avatar,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (friendData.active == true)
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 40, left: 40),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.white),
                                shape: BoxShape.circle,
                                color: Color(0xFF36FF00)),
                          )
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
          if (haveName)
            Container(
              width: 50,
              child: Text(
                friendData.name,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}

Widget messangerWidget(
    {required MessangerData messangerData, required BuildContext context}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/introMessanger',
            arguments: messangerData),
        child: Slidable(
          startActionPane: ActionPane(motion: ScrollMotion(), children: [
            CustomSlidableAction(
                padding: const EdgeInsets.all(10),
                onPressed: (BuildContext context) {},
                child: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFF384CFF)),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                )),
            CustomSlidableAction(
                onPressed: (BuildContext context) {},
                child: Container(
                  child: const Icon(Icons.phone),
                )),
            CustomSlidableAction(
                onPressed: (BuildContext context) {},
                child: Container(
                  child: const Icon(Icons.video_camera_back),
                )),
          ]),
          endActionPane: ActionPane(motion: ScrollMotion(), children: [
            CustomSlidableAction(
                onPressed: (BuildContext context) {},
                child: Container(
                  child: const Icon(Icons.menu),
                )),
            CustomSlidableAction(
                onPressed: (BuildContext context) {},
                child: Container(
                  child: const Icon(Icons.notifications),
                )),
            CustomSlidableAction(
                padding: const EdgeInsets.all(10),
                onPressed: (BuildContext context) {},
                child: Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                )),
          ]),
          child: Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 65,
                      height: 55,
                      child: friendWidget(
                          friendData: messangerData.friendData,
                          haveName: false),
                    ),
                    Container(
                      width: 205,
                      height: 40,
                      child: Column(
                        children: [
                          Container(
                            width: 205,
                            height: 20,
                            child: Text(
                              messangerData.friendData.name,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3),
                            width: 205,
                            height: 20,
                            child: Text(
                              messangerData.myLast
                                  ? 'You: ' +
                                      messangerData.messangerLast +
                                      ' ' +
                                      messangerData.time
                                  : messangerData.messangerLast +
                                      ' ' +
                                      messangerData.time,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if (messangerData.wachted)
                  ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                                colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            .createShader(bounds);
                      },
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.white,
                      )),
                if (messangerData.wachted == false)
                  Container(
                    child: const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 1,
      ),
    ],
  );
}
