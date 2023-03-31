import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress.text, password: password.text);

      await FirebaseAuth.instance.currentUser?.updateDisplayName(fullName.text);

      print(credential);

      showSnackbar(context, 'Registration successful!');

      Get.offAllNamed('/');
    } on FirebaseAuthException catch (e) {
      String snackbarMessage = '';

      if (e.code == 'weak-password') {
        snackbarMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        snackbarMessage = 'The account already exists for that email.';
      } else {
        snackbarMessage = e.message.toString();
      }

      showSnackbar(context, snackbarMessage);
    } catch (e) {
      print(e);
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating,));
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
              'Aksara Registration',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 36,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text('Full Name'),
              ),
              keyboardType: TextInputType.name,
              controller: fullName,
            ),
            const SizedBox(
              height: 8,
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
                    registerUser(context);
                  },
                  child: const Text('Register')),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text('or'),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Already have an account?',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'Login Now',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
