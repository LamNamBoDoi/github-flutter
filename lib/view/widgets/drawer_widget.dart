import 'package:firebase/consts/global_constrants.dart';
import 'package:firebase/view/screens/login_screen.dart';
import 'package:firebase/view/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  User? _user;
  Future<void> _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: homescafold_color,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/bubble-tea_drawer.png',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin: ${_user?.displayName}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(_user!.email.toString()),
                    ],
                  )),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                try {
                  Navigator.pushNamed(context, '/');
                } catch (e) {
                  print(e);
                }
              },
              child: buildrawertile(context, "Home", Icons.home_filled),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/listorderscreen');
              },
              child: buildrawertile(context, "List order", Icons.list_alt),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/editmenu');
              },
              child: buildrawertile(context, "Edit menu", Icons.edit_document),
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                showToast(message: "Successfully signed out");
              },
              child: buildrawertile(context, "Log Out", Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildrawertile(BuildContext context, String title, IconData title_ic) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        Icon(title_ic)
      ],
    ),
  );
}
