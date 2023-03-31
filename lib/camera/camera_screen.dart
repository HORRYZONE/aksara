import 'package:aksara/camera/camera_viewer.dart';
import 'package:aksara/camera/capture_button.dart';
import 'package:aksara/camera/top_image_viewer.dart';
import 'package:flutter/material.dart';


class CameraScreen extends StatelessWidget{
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: const [
        CameraViewer(),
        CaptureButton(),
        TopImageViewer(),
      ],
    );
  }
}
