import 'package:dbhive_sample/screens/add_student_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dbhive_sample/db/functions/db_functions.dart';
import '../db/model/data_model.dart';



class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child:Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),
          const SizedBox(height:10),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Age',
            ),
          ),
          const SizedBox(height:10),
          ElevatedButton.icon(
            onPressed: () {
              onAddStudentButtonClicked();
            }, 
            label: const Text('Add Student'),
            icon: const Icon(Icons.add)
          )
        ],
      )
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();

    if(_name.isEmpty || _age.isEmpty) {
      return;
    }

    final _student = StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}