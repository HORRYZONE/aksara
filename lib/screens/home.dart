import 'package:aksara/components/home_action_bar.dart';
import 'package:aksara/components/intro_card.dart';
import 'package:aksara/components/lesson_card.dart';
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
                ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()
                  ),
                  itemBuilder: (context, index) {
                    return LessonCard(title: 'Lesson 1', progress: 0, name: 'Alphabet');
                  },
                ),
              ],
            ),
          ),
          AksaraNavigationBar()
        ],
      ),
    );
  }
}
