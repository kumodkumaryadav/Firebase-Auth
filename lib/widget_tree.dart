import 'package:firebase_login/firebase%20service/auth.dart';
import 'package:firebase_login/screens/home_screen.dart';
import 'package:firebase_login/screens/loginscreen.dart';
import 'package:flutter/material.dart';


class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if(snapshot.hasData){
          return const HomePage();
        }
        else {
          return LoginPage();
        }
       },);
  }
}