import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isDarkMode = false.obs;

  void toggleTheme() {
    bool nextCondition = !isDarkMode.value;

    isDarkMode.value = nextCondition;

    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
