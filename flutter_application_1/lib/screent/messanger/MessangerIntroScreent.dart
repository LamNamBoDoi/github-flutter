import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/MessangerData.dart';
import 'package:flutter_application_1/widget/imageLinear.dart';

class MessangerIntroScreent extends StatefulWidget {
  const MessangerIntroScreent({super.key});

  @override
  State<MessangerIntroScreent> createState() => _MessangerIntroScreentState();
}

class _MessangerIntroScreentState extends State<MessangerIntroScreent> {
  @override
  Widget build(BuildContext context) {
    MessangerData? messangerData =
        ModalRoute.of(context)?.settings.arguments as MessangerData;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 44),
                height: 55,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Image.asset(
                              'assets/back.png',
                              color: Color(0xFF0584FE),
                              height: 23,
                              width: 13,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, '/messangerChat',
                              arguments: messangerData.friendData),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                messangerData.friendData.avatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(messangerData.friendData.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Messanger',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                                    colors: [
                                  Color(0xFF384CFF),
                                  Color(0xFF00A3FF)
                                ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)
                                .createShader(bounds);
                          },
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                                    colors: [
                                  Color(0xFF384CFF),
                                  Color(0xFF00A3FF)
                                ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight)
                                .createShader(bounds);
                          },
                          child: const Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 225,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              messangerData.friendData.avatar,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(messangerData.friendData.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "You're friends on Facebook",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: 60,
                              height: 40,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      messangerData.friendData.avatar,
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/anhnen.jpg',
                                        height: 38,
                                        width: 38,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Say hi to your new Facebook friend, Maisy.",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '21:32',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        messanger(
                            messangerData: messangerData,
                            text: '\u{1F590}',
                            myMessanger: true,
                            friendMessanging: true,
                            icon: true,
                            size: 60),
                        Text(
                          '16:44',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        messanger(
                            messangerData: messangerData,
                            text: 'Hello, Jacob!',
                            myMessanger: false,
                            friendMessanging: false),
                        messanger(
                            messangerData: messangerData,
                            text: 'How are you doing?',
                            myMessanger: false,
                            friendMessanging: true),
                        SizedBox(
                          height: 15,
                        ),
                        messanger(
                            messangerData: messangerData,
                            text: "It’s morning in Mumbai 😎",
                            myMessanger: true,
                            friendMessanging: false),
                        SizedBox(
                          height: 15,
                        ),
                        messanger(
                            messangerData: messangerData,
                            text: "What is the most popular meal in mumbai??",
                            myMessanger: false,
                            friendMessanging: true),
                        SizedBox(
                          height: 15,
                        ),
                        messanger(
                            messangerData: messangerData,
                            text: "I think top two are:",
                            myMessanger: true,
                            friendMessanging: false),
                        messanger(
                            messangerData: messangerData,
                            text: '',
                            myMessanger: true,
                            images: ['assets/food.jpg', 'assets/food1.jpg'],
                            icon: true),
                        SizedBox(
                          height: 70,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    imageLinear(
                        image: 'assets/more.png', height: 24, width: 24),
                    imageLinear(
                        image: 'assets/camera.png', height: 24, width: 24),
                    imageLinear(
                        image: 'assets/imageI.png', height: 20, width: 22),
                    imageLinear(image: 'assets/mic.png', height: 22, width: 22),
                    Container(
                      width: 135,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFEEEEEE).withOpacity(0.5)),
                      child: Row(
                        children: [
                          Container(
                            height: 36,
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            width: 105,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Aa',
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          imageLinear(
                              image: 'assets/smiley.png', height: 24, width: 24)
                        ],
                      ),
                    ),
                    imageLinear(
                        image: 'assets/like1.png', height: 24, width: 24)
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget messanger(
      {required MessangerData messangerData,
      required String text,
      double? size,
      required bool myMessanger,
      bool? friendMessanging,
      bool? icon,
      List? images}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: myMessanger == true
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (friendMessanging == true && myMessanger == false)
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/messangerChat',
                      arguments: messangerData.friendData),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      messangerData.friendData.avatar,
                      height: 26,
                      width: 26,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 26,
                  height: 26,
                ),
              SizedBox(
                width: 10,
              ),
              Container(
                  constraints: images == null
                      ? BoxConstraints(maxWidth: 170)
                      : BoxConstraints(maxWidth: 242),
                  padding: EdgeInsets.symmetric(
                      horizontal: images == null ? 10 : 0,
                      vertical: images == null ? 5 : 0),
                  decoration: BoxDecoration(
                    color: icon != true ? Colors.grey.withOpacity(0.4) : null,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: myMessanger == true
                          ? Radius.circular(10)
                          : Radius.circular(0),
                      bottomRight: myMessanger == false
                          ? Radius.circular(10)
                          : Radius.circular(0),
                    ),
                  ),
                  child: images != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: images
                              .map((image) => Padding(
                                    padding: const EdgeInsets.only(left: 1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        image,
                                        height: 62,
                                        fit: BoxFit.cover,
                                        width: 110,
                                      ),
                                    ),
                                  ))
                              .toList())
                      : Text(
                          text,
                          style: TextStyle(
                              fontSize: size ?? 14,
                              fontWeight: FontWeight.w400),
                        )),
              SizedBox(
                width: 10,
              ),
              if (myMessanger)
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                            colors: [Color(0xFF384CFF), Color(0xFF0584FE)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        .createShader(bounds);
                  },
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}
