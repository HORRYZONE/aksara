import 'package:aksara/LearnPage.dart';
import 'package:aksara/screens/Lesson_1.dart';
import 'package:aksara/screens/aksara_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:aksara/controllers/app_controller.dart';
import 'package:aksara/firebase_options.dart';
import 'package:aksara/screens/auth/login_screen.dart';
import 'package:aksara/screens/auth/registration_screen.dart';
import 'package:aksara/screens/profile_screen.dart';
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
import 'package:onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print(e.toString());
  }

  runApp(const AksaraApp());

  if (!kIsWeb && Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}

class AksaraApp extends StatefulWidget {
  const AksaraApp({super.key});

  @override
  State<AksaraApp> createState() => _AksaraAppState();
}

class _AksaraAppState extends State<AksaraApp> {

  bool isLoggedIn = false;

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
        initialRoute: isLoggedIn ? '/' : '/onboarding',
        routes: {
          '/': (context) => const HomeScreen(),
          '/auth/login': (context) => LoginScreen(),
          '/auth/register': (context) => RegistrationScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/onboarding': (context) => const AksaraOnboarding()
        },
      );
    });
  }
}
