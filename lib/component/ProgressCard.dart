import 'package:aksara/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProgressCard extends StatefulWidget {
  final String text;
  final String child;
  ProgressCard({required this.text, required this.child});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {

  String chapter = '';
  String alphabet = '';

  @override
  void initState() {
    super.initState();
    chapter = widget.text;
    alphabet = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      height: 80,
      width:  double.maxFinite,
      child: ElevatedButton(
        onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Apptheme.colors.lightBlue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
          )
        ),

        child: Container(
          height: 80,
          width: double.maxFinite,


          child: Column(
            children: [
              Container(
                width: 153,
                height: 25,
                margin: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2
                  )
                ),
                child: Center(
                  child: Text(chapter,
                  style: TextStyle(
                    color: Colors.black
                  ),
                  ),
                ),
              ),
              Text(alphabet,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              )
            ],
          ),
        )
      ),
    )
    );
  }
}
