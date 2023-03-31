import 'package:get/get.dart';

class AppController extends GetxController {
  var darkTheme = false.obs;

  void changeDarkTheme(bool isDark) {
    darkTheme.value = isDark;
  }
}
