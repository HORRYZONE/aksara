import 'package:aksara/component/lesson_1_nav.dart';
import 'package:aksara/themes/app_theme.dart';
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
              Card(
                elevation: 0,
                color: Colors.lightBlue,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: [
                      Text('Overview',
                      style: TextStyle(
                      color: Apptheme.colors.white,
                      ),
                      ),
                      Text('In this lesson, we will learn about the hand sign used to symbolize the alphabets from A - Z'),
                    ],
                  )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
