import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Screen(),));
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(image:
        DecorationImage(image: AssetImage('images/SplashScreen.jpg'),fit: BoxFit.fill)),
      )
    );
  }
}
