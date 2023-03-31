import 'package:aksara/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeActionBar extends StatelessWidget {
  const HomeActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.put(HomeController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.question_circle)),
          GetX<HomeController>(builder: (controller) {
            return Switch(
                value: controller.isDarkMode.value,
                onChanged: (state) {
                  controller.toggleTheme();
                });
          })
        ],
      ),
    );
  }
}
