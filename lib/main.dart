import 'package:flutter/material.dart';
import 'package:flutter_todo_api/pages/homepage.dart';
import 'package:flutter_todo_api/strings.dart';
import 'package:flutter_todo_api/pages/auth_req.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token == '' ? const AuthReq() : HomePage(isNew: false),
    );
  }
}
