import 'package:flutter/material.dart';
import 'package:sqflite_demo/Screens/screen_main.dart';
import 'package:sqflite_demo/db/functions/db_functions.dart';

Future<void>main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primaryColor: Colors.blueAccent
         
      ),
      home: screen_main(),
    );
  }
}