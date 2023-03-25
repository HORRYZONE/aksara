import 'package:aksara/camera/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraViewer extends StatelessWidget {
  const CameraViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ScanController>(builder: (controller){
      if (!controller.isInitalized) {
        return Container();
      }
      return SizedBox(
          height: Get.height,
          width: Get.width,
          child: CameraPreview(controller.cameraController));

    });
  }
}
