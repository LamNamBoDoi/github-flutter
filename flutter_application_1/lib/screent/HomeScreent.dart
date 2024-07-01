import 'package:flutter/material.dart';
import 'package:flutter_application_1/screent/Tabs/FriendTabs.dart';
import 'package:flutter_application_1/screent/Tabs/HomeTabs/HomeTabs.dart';
import 'package:flutter_application_1/screent/Tabs/MenuTabs.dart';
import 'package:flutter_application_1/screent/Tabs/NotificationTabs.dart';
import 'package:flutter_application_1/screent/Tabs/PersonalTabs.dart';
import 'package:flutter_application_1/screent/Tabs/WatchTabs.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreent extends StatefulWidget {
  const HomeScreent({super.key});

  @override
  State<HomeScreent> createState() => _HomeScreentState();
}

class _HomeScreentState extends State<HomeScreent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFF384CFF), Color(0xFF00A3FF)],
              ).createShader(bounds);
            },
            child: const Text(
              'facebook',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            ShaderMask(
                shaderCallback: (Rect bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF00B1FF),
                        Color(0xFF006BFF),
                      ],
                    ).createShader(bounds),
                blendMode: BlendMode.srcIn,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/messanger');
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Image.asset(
                        'assets/messenger.png',
                        height: 26,
                        width: 26,
                      ),
                    ))),
          ],
          bottom: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.black,
              indicator: DotIndicator(
                color: Colors.blue,
                distanceFromCenter: 18,
                radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
              labelColor: Colors.blue,
              tabs: [
                Tab(
                    icon: tabController.index == 0
                        ? Icon(
                            Icons.home_outlined,
                            size: 28,
                          )
                        : Icon(
                            Icons.home_outlined,
                            size: 28,
                          )),
                Tab(
                  child: tabController.index == 1
                      ? Image.asset(
                          'assets/doublepeople.png',
                          width: 24,
                          height: 28,
                          color: Colors.blue,
                        )
                      : Image.asset(
                          'assets/doublepeople.png',
                          width: 24,
                          height: 28,
                        ),
                ),
                Tab(
                  child: tabController.index == 2
                      ? Image.asset(
                          'assets/user.png',
                          width: 20,
                          height: 24,
                          color: Colors.blue,
                        )
                      : Image.asset(
                          'assets/user.png',
                          width: 20,
                          height: 24,
                        ),
                ),
                Tab(
                    icon: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: tabController.index == 3
                              ? Image.asset(
                                  'assets/play.png',
                                  width: 24,
                                  height: 28,
                                  color: Colors.blue,
                                )
                              : Image.asset(
                                  'assets/play.png',
                                  width: 24,
                                  height: 28,
                                ),
                        ),
                      ],
                    ),
                    if (tabController.index != 3)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: const Center(
                                child: Text(
                              '9',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      )
                    else
                      SizedBox.shrink(),
                  ],
                )),
                Tab(
                    icon: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        tabController.index == 4
                            ? Image.asset(
                                'assets/bell.png',
                                width: 24,
                                height: 28,
                                color: Colors.blue,
                              )
                            : Image.asset(
                                'assets/bell.png',
                                width: 24,
                                height: 28,
                              ),
                      ],
                    ),
                    if (tabController.index != 4)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: const Center(
                                child: Text(
                              '3',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      )
                    else
                      SizedBox.shrink(),
                  ],
                )),
                Tab(icon: Icon(Icons.menu_outlined)),
              ]),
        ),
        body: TabBarView(controller: tabController, children: const [
          HomeTabs(),
          FriendTabs(),
          PersonalTabs(),
          WatchTabs(),
          NotificationTabs(),
          MenuTabs()
        ]),
      ),
    );
  }
}
