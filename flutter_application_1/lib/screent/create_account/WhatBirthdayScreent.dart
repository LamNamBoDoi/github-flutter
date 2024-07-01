import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class WhatBirthdayScreent extends StatefulWidget {
  const WhatBirthdayScreent({super.key});

  @override
  State<WhatBirthdayScreent> createState() => _WhatBirthdayScreentState();
}

class _WhatBirthdayScreentState extends State<WhatBirthdayScreent> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: "Birthday"),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "What's your birthday?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Choose your date of birth",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black45),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "You can always make this private later",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black45),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: DatePickerWidget(
              looping: false,
              firstDate: DateTime(1950, 01, 01),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              dateFormat: "dd-MMM-yyyy",
              locale: DatePicker.localeFromString('en'),
              onChange: (DateTime newDate, _) => changDate(newDate),
              pickerTheme: DateTimePickerTheme(
                  itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                  dividerColor: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (_selectedDate != null)
            Text(
              '${calculateAge(_selectedDate!)} Years old',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          SizedBox(
            height: 50,
          ),
          ButtonWidget(text: 'Next', route: '/whatGender')
        ],
      )),
    );
  }

  void changDate(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  int calculateAge(DateTime date) {
    DateTime today = DateTime.now();
    int age = today.year - date.year;

    if (today.month < date.month ||
        (today.month == date.month && today.day < date.day)) {
      age--;
    }
    return age;
  }
}
