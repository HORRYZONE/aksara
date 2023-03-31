import 'dart:io';

import 'package:aksara/controllers/app_controller.dart';
import 'package:aksara/firebase_options.dart';
import 'package:aksara/screens/auth/login_screen.dart';
import 'package:aksara/screens/auth/registration_screen.dart';
import 'package:aksara/utils/app_theme.dart';
import 'package:aksara/screens/home.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());

  if (!kIsWeb && Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print(user);
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AksaraTheme(lightDynamic).lightMode(),
        darkTheme: AksaraTheme(darkDynamic).darkMode(),
        themeMode: ThemeMode.light,
        initialRoute: isLoggedIn ? '/' : '/auth/login',
        routes: {
          '/': (context) => const HomeScreen(),
          '/auth/login': (context) => LoginScreen(),
          '/auth/register': (context) => RegistrationScreen(),
        },
      );
    });
  }
}


// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final AppController c = Get.put(AppController());

//   @override
//   Widget build(BuildContext context) {
//     return DynamicColorBuilder(
//         builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
//       return GetMaterialApp(
//         title: 'Flutter Demo',
//         theme: AksaraTheme(lightDynamic).lightMode(),
//         darkTheme: AksaraTheme(darkDynamic).darkMode(),
//         themeMode: ThemeMode.light,
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const HomeScreen(),
//           '/auth/login': (context) => LoginScreen(),
//           '/auth/register': (context) => RegistrationScreen(),
//         },
//       );
//     });
//   }
// }
