import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IntroCard extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: const Color(0xFFF89300),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${user?.displayName ?? 'user'}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text('How are you?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      user?.photoURL ??
                          'https://stonegatesl.com/wp-content/uploads/2021/01/avatar.jpg',
                      loadingBuilder: (context, child, loadingProgress) {
                        print(loadingProgress);
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
