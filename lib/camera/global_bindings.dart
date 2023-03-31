
import 'package:aksara/camera/scan_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ScanController>(() => ScanController());
  }

}