import 'package:chatapp/services/auth/login_or_signup.dart';
import 'package:chatapp/pages/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return Homepage();
          }
          else {
            return loginorsignup();
          }
        },
      ),
    );
  }
}