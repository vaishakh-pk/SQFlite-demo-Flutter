import 'package:flutter/material.dart';

import '../../db/functions/db_functions.dart';
import '../../db/model/data_model.dart';

class AddStudentWidget extends StatelessWidget {
   AddStudentWidget({super.key});

  final _nameControlller = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children:[
            TextFormField(
              controller: _nameControlller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 15,),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            ElevatedButton(onPressed: (){submitInput();}, child: Text('Submit'))
        ]),
    );
  }

  Future<void> submitInput() async{
    final _name = _nameControlller.text.trim();
    final _age = _ageController.text.trim();

    if(_name.isEmpty || _age.isEmpty)
    {
      return;
    }
    print('$_name $_age');

  final _student = StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}