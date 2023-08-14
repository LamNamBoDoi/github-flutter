import 'package:flutter/material.dart';
import 'package:hello_world/widget/custem_text_form_field.dart';
import 'package:intl/intl.dart';

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
  DateTime? _dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add Employee'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))]),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          CustomTextFormField(
              controller: _userNameController, txtlabel: 'User Name'),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              controller: _firstNameController, txtlabel: 'First Name'),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              controller: _lastNameController, txtlabel: 'Last Name'),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _dateOfBirthController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Date of birth'),
            ),
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Date of birth cannot be empty';
            },
            onTap: () => pickDateOfBirth(context),
          )
        ]),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initiaDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfBirth ?? initiaDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                  colorScheme: const ColorScheme.light(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      onSurface: Colors.black),
                  dialogBackgroundColor: Colors.white),
              child: child ?? const Text(''),
            ));
    if (newDate == null) return;
    setState(() {
      // _dateOfBirth = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirthController.text = dob;
    });
  }
}
