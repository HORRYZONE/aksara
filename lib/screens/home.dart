import 'package:aksara/components/home_action_bar.dart';
import 'package:aksara/components/intro_card.dart';
import 'package:aksara/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aksara'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              children: [
                IntroCard(),
                HomeActionBar(),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/auth/login');
                    },
                    child: const Text('Login')),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/auth/register');
                    },
                    child: const Text('Register'))
              ],
            ),
          ),
          AksaraNavigationBar()
        ],
      ),
    );
  }
}