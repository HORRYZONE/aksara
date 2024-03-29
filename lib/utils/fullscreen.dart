import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await FullScreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await FullScreen.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                enterFullScreen(FullScreenMode.LEANBACK);
              },
              child: new Icon(Icons.fullscreen),
            ),
            FloatingActionButton(
              onPressed: () async {
                exitFullScreen();
              },
              child: new Icon(Icons.fullscreen_exit),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Fullscreen plugin'),
        ),
        body: Center(child: new Text('Flutter full screen plugin')),
      ),
    );
  }
}