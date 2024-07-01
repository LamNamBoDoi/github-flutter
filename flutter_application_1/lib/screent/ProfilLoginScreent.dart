import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_application_1/widget/logofacewidget.dart';

class ProfilLoginScreent extends StatefulWidget {
  const ProfilLoginScreent({super.key});

  @override
  State<ProfilLoginScreent> createState() => _ProfilLoginScreentState();
}

class _ProfilLoginScreentState extends State<ProfilLoginScreent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: LogoFaceWidget(width: 50, height: 70)),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/home'),
                          child: Row(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/anhnen.jpg',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 22,
                                          height: 22,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1)),
                                          child: Center(
                                              child: Text(
                                            '7',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Sanjay Shendy',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, '/login'),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Color(0xFF384CFF), width: 1),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xFF384CFF),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Log into Another Account',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF384CFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, '/login'),
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF384CFF),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Find your account',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF384CFF),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ButtonWidget(
            text: 'Create New Facebook Account', route: '/joinFacebook')
      ]),
    );
  }
}
