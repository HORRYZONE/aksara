import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress.text, password: password.text);

      print(credential);
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = e.message.toString();
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage), behavior: SnackBarBehavior.floating));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login to Aksara',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 36,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text('Email Address'),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: emailAddress,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: const Text('Password')),
              obscureText: true,
              controller: password,
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    signIn(context);
                  },
                  child: const Text('Login')),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text('or'),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF4285f4)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return 0;
                      }
                      if (states.contains(MaterialState.focused)) {
                        return 0;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return 0;
                      }
                      return 0;
                    }),
                  ),
                  onPressed: () {},
                  child: const Text('Sign in with Google')),
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return 0;
                      }
                      if (states.contains(MaterialState.focused)) {
                        return 0;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return 0;
                      }
                      return 0;
                    }),
                  ),
                  onPressed: () {},
                  child: const Text('Sign in with Microsoft')),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/auth/register');
              },
              child: const Text(
                'Register now!',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
