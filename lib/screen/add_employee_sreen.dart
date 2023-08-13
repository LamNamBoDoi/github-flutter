import 'package:flutter/material.dart';
import 'package:hello_world/widget/custom_text_form_field.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add employee'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          CustomTextFormField(
            controller: _userNameController,
            txtLabel: 'User Name',
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            controller: _firstNameController,
            txtLabel: 'First Name',
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            controller: _lastNameController,
            txtLabel: 'Last Name',
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            controller: _dateOfBirthController,
            txtLabel: 'Date Of Birth',
          ),
          SizedBox(
            height: 8,
          ),
        ]),
      ),
    );
  }
}
