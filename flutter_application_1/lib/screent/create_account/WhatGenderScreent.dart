import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/AppbarWidget.dart';
import 'package:flutter_application_1/widget/ButtonWidget.dart';

class WhatGenderScreent extends StatefulWidget {
  const WhatGenderScreent({super.key});

  @override
  State<WhatGenderScreent> createState() => _WhatGenderScreentState();
}

class _WhatGenderScreentState extends State<WhatGenderScreent> {
  int _selectedGender = 0;
  final List<String> genders = ['Female', 'Male', 'Custom'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(text: 'Gender'),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "What's your gender",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You can change who see your gender on your profile later',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 70,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                genders[index],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              Radio(
                                  value: index,
                                  groupValue: _selectedGender,
                                  onChanged: _handleRadio)
                            ],
                          ),
                          if (genders[index] == 'Custom')
                            Text(
                              "Select custome to choose another gender,\nor if you'd rather not stay",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45),
                            ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            ButtonWidget(text: 'Next', route: '/mobileNumber'),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }

  void _handleRadio(int? value) {
    setState(() {
      _selectedGender = value!;
    });
  }
}
