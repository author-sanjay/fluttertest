// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/listview.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 102, 94, 194),
        child: Center(
            child: GestureDetector(
          onTap: (() async {
            await FirebaseAuth.instance
                .signInWithProvider(GoogleAuthProvider()).then((value) =>Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Listview(),
              ),)

                 
            );
          }),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 40,
            color: Color.fromARGB(255, 46, 198, 147),
            child: Center(
              child: Text(
                "Sign In with Google",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )),
      )),
    );
  }
}
