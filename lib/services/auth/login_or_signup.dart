import 'package:chatapp/pages/login_page.dart';
import 'package:chatapp/pages/signup_page.dart';
import 'package:flutter/material.dart';

class loginorsignup extends StatefulWidget {
  const loginorsignup({super.key});

  @override
  State<loginorsignup> createState() => _loginorsignupState();
}

class _loginorsignupState extends State<loginorsignup> {
  bool showLoginPage=true;
  void togglepagges(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return login(onTap:togglepagges ,);
    }
    else{
      return SignUp(
        onTap: togglepagges,
      );
    }
  }
}