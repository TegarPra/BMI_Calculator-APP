import 'package:flutter/material.dart';
import 'dart:async';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/BMI - Calculator.jpg',
          fit: BoxFit.cover, // Memastikan gambar memenuhi layar
        ),
      ),
    );
  }
}
