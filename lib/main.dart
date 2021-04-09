import 'package:flutter/material.dart';
import 'package:simple_todo/pages/top_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack A Ton: 20210409',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[150],
        primarySwatch: Colors.blue,
      ),
      home: TopPage(title: 'Demo To Do List'),
    );
  }
}

//todo
