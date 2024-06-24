import 'dart:async';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {


    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),),);
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 450,
          width: 400,
          child: Image.asset('assets/img/rahim_splash.png',fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
