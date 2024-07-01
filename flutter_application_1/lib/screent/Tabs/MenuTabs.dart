import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/ShortusData.dart';
import 'package:flutter_application_1/widget/ButtonOutlineWidget.dart';

class MenuTabs extends StatefulWidget {
  const MenuTabs({super.key});

  @override
  State<MenuTabs> createState() => _MenuTabsState();
}

class _MenuTabsState extends State<MenuTabs> {
  List<ShortusData> list = [
    ShortusData(name: 'Jobs', icon: Icons.work),
    ShortusData(name: 'COVID-19 information Center', icon: Icons.lock),
    ShortusData(name: 'Marketplace', icon: Icons.place),
    ShortusData(name: 'Friends', icon: Icons.people_alt),
    ShortusData(name: 'Events', icon: Icons.event),
    ShortusData(name: 'Gaming', icon: Icons.games),
    ShortusData(name: 'Weather', icon: Icons.cloud),
    ShortusData(name: 'Saved', icon: Icons.save),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                  child: Icon(Icons.search_outlined),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Shorctus',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: ButtonOutlineWidget(
                        strokeWidth: 2,
                        radius: 7,
                        gradient: LinearGradient(
                            colors: [Color(0xFF384CFF), Color(0xFF00A3FF)]),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color(0xFF384CFF),
                                      Color(0xFF00A3FF)
                                    ],
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  list[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                            colors: [
                                          Color(0xFF384CFF),
                                          Color(0xFF00A3FF)
                                        ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)
                                        .createShader(bounds);
                                  },
                                  child: Icon(
                                    list[index].icon,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        onPressed: () {}),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ButtonOutlineWidget(
                strokeWidth: 2,
                radius: 7,
                gradient: LinearGradient(
                    colors: [Color(0xFF555555), Color(0xFF555555)]),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: Text(
                    'See more',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {}),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFAAAAAAA)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Community resources',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.library_books)
              ],
            ),
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFAAAAAAA)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.lightbulb)
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profilLogin'),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Color(0xFFAAAAAAA)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Settings & Privacy',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.settings)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
