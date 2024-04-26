import 'dart:async';

import '../../../init_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "spalschScreen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacementNamed(InitScreen.routeName);
      },
    );
    return Scaffold(
      body: Image.asset(
        'assets/image/Splash_Screen.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
