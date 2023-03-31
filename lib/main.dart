import 'package:aksara/LearnPage.dart';
import 'package:aksara/screens/Lesson1.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyPageView(),
      '/lesson1': (context) => const Lesson1State()
    },
  ));
  await GetStorage.init();

  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    print(e.toString());
  }

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

  bool thirdPage = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page == 2) {
        setState(() {
          thirdPage = true;
        });
      }
    });
  }

  void _goToNextPage() {
    _controller.animateToPage(_controller.page!.toInt() + 1, duration: Duration(milliseconds: 500), curve: Curves.ease);
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 120),
        child: PageView(
          controller: _controller,
          children: [
            Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 68,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFACE4FF), // background color
                              foregroundColor: Colors.white, // text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // button border radius
                              ),
                              minimumSize: Size(67, 26), // button size
                            ),
                            child: Text('Skip'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 120),
                        child: Image.asset('assets/Welcome_1.png')
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(

                          ),
                              child: Text('Boundless Communication',
                              style: TextStyle(
                              fontFamily:'ConcertOne',
                              fontSize: 25,
                                color: Colors.black,
                              ),
                              ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 13),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 69,
                          maxWidth: 309,
                        ),
                        child: Text('Communicate comfortably with the aid of two ways sign language translator',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily:'Varela',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),


            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 68,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFACE4FF), // background color
                            foregroundColor: Colors.white, // text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // button border radius
                            ),
                            minimumSize: Size(67, 26), // button size
                          ),
                          child: Text('Skip'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 120),
                      child: Image.asset('assets/Welcome_2.png')
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(

                      ),
                      child: Text('Easy Learning',
                        style: TextStyle(
                          fontFamily:'ConcertOne',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 69,
                        maxWidth: 309,
                      ),
                      child: Text('Learn and improve your sign language skill with interactive learning session anytime and anywhere',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:'Varela',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [

                  Container(
                      margin: EdgeInsets.only(top: 220),
                      child: Image.asset('assets/Welcome_3.png')
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(

                      ),
                      child: Text('Keep Connected',
                        style: TextStyle(
                          fontFamily:'ConcertOne',
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 69,
                        maxWidth: 309,
                      ),
                      child: Text('Make new friends and interact virtually across the globe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:'Varela',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 120,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBox(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomIndicator(
                        netDragPercent: 0.5,
                        pagesLength: 3,
                        indicator: Indicator(
                            indicatorDesign: IndicatorDesign.line(
                                lineDesign: LineDesign(
                                  lineType: DesignType.line_nonuniform,
                                )
                            )
                        )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 343,
              child: thirdPage ? ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed('/lesson1');
              }, child: Text('Continue') ): FloatingActionButton(
                onPressed:  _goToNextPage,
                backgroundColor: Color(0xFFFFA149),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('NEXT',
                  textAlign: TextAlign.center,
                ),
              ),

            ),
          ],
        ),
      ),
    );
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
          '/profile': (context) => const ProfileScreen()
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
