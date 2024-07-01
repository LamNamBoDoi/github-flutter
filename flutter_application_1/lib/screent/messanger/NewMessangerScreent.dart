import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/FriendData.dart';
import 'package:flutter_application_1/data/MessangerData.dart';

class NewMessangerScreent extends StatefulWidget {
  const NewMessangerScreent({super.key});

  @override
  State<NewMessangerScreent> createState() => _NewMessangerScreentState();
}

class _NewMessangerScreentState extends State<NewMessangerScreent> {
  bool _switchValue = true;

  List<FriendData> listFriend = [
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
    FriendData(name: 'Bear', avatar: 'assets/threebear.jpg', active: false),
    FriendData(
        name: 'Cristino Ronaldo',
        avatar: 'assets/ronaldoavatar.jpg',
        active: true),
    FriendData(name: 'Lucy', avatar: 'assets/onepiece.jpg', active: false),
    FriendData(name: 'Bear', avatar: 'assets/threebear.jpg', active: true),
  ];

  void changeValue() {
    setState(() {
      _switchValue = !_switchValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 55,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 55,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'New messange',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 7),
                            width: 25,
                            height: 20,
                            child: const Text(
                              'To:',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                              width: 135,
                              height: 20,
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a name or group',
                                  hintStyle: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w400),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 42,
                  height: 24,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xFF384CFF), Color(0xFF00A3FF)]),
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    width: 38,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: _switchValue == true
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => changeValue(),
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFF384CFF)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(0, 3)),
                                ]),
                            child: const Icon(
                              Icons.lock,
                              size: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 35,
            padding: const EdgeInsets.only(left: 10, top: 5),
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: [
                ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF384CFF),
                            Color(0xFF00A3FF),
                          ],
                        ).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: Container(
                        child: const Center(child: Icon(Icons.group)))),
                const SizedBox(
                  width: 10,
                ),
                ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
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
                            child: Text(
                      'Create a new group.',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )))),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 10, bottom: 5),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              children: [
                ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF384CFF),
                            Color(0xFF00A3FF),
                          ],
                        ).createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: Container(
                        child: const Center(child: Icon(Icons.video_call)))),
                const SizedBox(
                  width: 10,
                ),
                ShaderMask(
                    shaderCallback: (Rect bounds) => const LinearGradient(
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
                            child: Text(
                      'Create a new video call.',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )))),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10),
                      child: const Text(
                        'Suggested',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                        children: listFriend.map((friend) {
                      return suggestWidget(friendData: friend);
                    }).toList()),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget suggestWidget({required FriendData friendData}) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/introMessanger',
                    arguments: MessangerData(
                        friendData: friendData,
                        messangerLast: '',
                        time: '',
                        wachted: false,
                        myLast: false)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    friendData.avatar,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                friendData.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
