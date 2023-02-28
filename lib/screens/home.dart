import 'package:aksara/components/home_action_bar.dart';
import 'package:aksara/components/intro_card.dart';
import 'package:aksara/components/navigation_bar.dart';
import 'package:flutter/material.dart';

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
                HomeActionBar()
              ],
            ),
          ),
          AksaraNavigationBar()
        ],
      ),
    );
  }
}