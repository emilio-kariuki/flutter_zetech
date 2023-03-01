// ignore_for_file: body_might_complete_normally_nullable, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_lesson/home.dart';
import 'package:flutter/material.dart';

class Authentication {
  Future<User?> registerUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    User? user;

    try {
      user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;

      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
        return user;
      } else {
        print("User not created");
      }
    } catch (e) {
      print("the flutter error is $e");
    }
  }

  Future<User?> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    User? user;

    try {
      user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
        return user;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(e.toString())));
    }
  }
}
