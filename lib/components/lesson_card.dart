import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  String title;
  String name;
  int progress;

  LessonCard(
      {super.key, required this.title, required this.progress, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title),
                      Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                LinearProgressIndicator(value: progress.toDouble(),),
                Text('${progress.toString()} %', style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
