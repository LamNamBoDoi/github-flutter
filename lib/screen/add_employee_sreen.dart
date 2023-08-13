import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController _controller = TextEditingController();
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
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('User Name')),
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'User name cannot be empty';
            },
          )
        ]),
      ),
    );
  }
}
