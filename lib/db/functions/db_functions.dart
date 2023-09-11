import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initializeDatabase() async
{
  _db = await openDatabase('student_db',version:1,onCreate: (Database db, int version) async {
    await db.execute('CREATE TABLE student(id INT PRIMARY KEY,name TEXT, age TEXT)');
  });
}


Future<void> addStudent(StudentModel value) async
{
  await _db.rawInsert('INSERT INTO student(name,age) VALUES (?,?)',[value.name,value.age]);
  getAllStudents();
  
}

Future<void> getAllStudents() async
{
  final _values = await _db.rawQuery('SELECT * FROM student');
  studentListNotifier.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
    print(student);
   });

   
  
  
}



Future<void> deleteStudent(StudentModel data) async{
  print("control at delete function");
  print(data.name);
  int count = await _db.rawDelete('DELETE FROM student WHERE name = ?', [data.name]);
  getAllStudents();

}
