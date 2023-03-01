import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 3,
        itemBuilder: (_,i){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/Welcome_1.png')),
                ],
              ),
            );
        },
      ),
    );
  }
}
