import 'package:flutter/material.dart';
import 'package:aksara/component/ProgressCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<String> _chapter = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
    'Chapter 4'
  ];

  final List<String> _topic = [
    'A - F',
    'G - L',
    'M - S',
    'T - Z'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body:  ListView.builder(
          itemCount: _chapter.length,  //how many card u need
          itemBuilder: (context, index) {
        return ProgressCard(text: _chapter[index],child: _topic[index]);
      }
      )

    );
  }
}
