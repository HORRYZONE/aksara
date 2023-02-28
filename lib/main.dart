import 'dart:io';

import 'package:aksara/controllers/app_controller.dart';
import 'package:aksara/utils/app_theme.dart';
import 'package:aksara/screens/home.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());

  if (!kIsWeb && Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppController c = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AksaraTheme(lightDynamic).lightMode(),
        darkTheme: AksaraTheme(darkDynamic).darkMode(),
        themeMode: ThemeMode.light,
        initialRoute: '/',
        routes: {'/': (context) => const HomeScreen()},
      );
    });
  }
}
