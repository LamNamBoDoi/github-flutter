import 'package:flutter/material.dart';

class FamilyProvider extends InheritedWidget {
  const FamilyProvider({super.key, required Widget child, this.colorOfHair})
      : super(child: child);
  final String? colorOfHair;
  @override
  bool updateShouldNotify(FamilyProvider oldWidget) {
    // TODO: implement updateShouldNotify
    return colorOfHair != oldWidget.colorOfHair;
  }

  static FamilyProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FamilyProvider>();
}

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FamilyProvider(
        colorOfHair: 'black',
        child: ChildWidget(),
      )),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final familyProvider = FamilyProvider.of(context);
    final String? colorOfHair = familyProvider!.colorOfHair;
    return colorOfHair == null
        ? CircularProgressIndicator()
        : Text(colorOfHair);
  }
}
