import 'package:flutter/material.dart';
import 'package:sqflite_demo/db/functions/db_functions.dart';

import 'Widgets/AddStudentWidget.dart';
import 'Widgets/ListStudentWidget.dart';

class screen_main extends StatelessWidget {
  const screen_main({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(child: Column(children: [
        AddStudentWidget(),
        const Expanded(child: ListStudentWidget())
      ],)),
    );
  }
}