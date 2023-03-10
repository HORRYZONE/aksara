import 'package:aksara/component/Lesson1_overviewCard.dart';
import 'package:aksara/component/lesson_1_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                  height: 250,
                  child: lesson_1_nav()
              ),
              lesson1_overviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
