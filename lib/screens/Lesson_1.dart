import 'package:aksara/component/Lesson1_overviewCard.dart';
import 'package:aksara/component/ProgressCard.dart';
import 'package:aksara/component/lesson_1_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool firstTime = true;


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
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('My App'),
        // ),
        body: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                    height: 250,
                    child: lesson_1_nav()
                ),
                lesson1_overviewCard(),
                ListView.builder(
                    itemCount: _chapter.length,  //how many card u need
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProgressCard(text: _chapter[index],child: _topic[index]);
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
