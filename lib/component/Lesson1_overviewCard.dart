import 'package:aksara/themes/app_theme.dart';
import 'package:flutter/material.dart';

class lesson1_overviewCard extends StatelessWidget {
  const lesson1_overviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
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
      ),
    );
  }
}
