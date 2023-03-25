import 'package:aksara/camera/camera_screen.dart';
import 'package:aksara/camera/global_bindings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CameraScreen(),
      initialBinding: GlobalBindings(),
    );
  }
}
