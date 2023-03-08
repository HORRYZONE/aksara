import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: Container(
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back_rounded),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(26, 36, 0, 30),
                      child: Text('Alphabet',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'ConcertOne',
                          fontSize: 40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: 193,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text('Start'),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Image(
                  image: AssetImage('assets/Lesson Icon.png'),

                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
