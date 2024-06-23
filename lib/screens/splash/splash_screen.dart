import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 580,
          width: 600,
          child: Image.asset('assets/img/rahim_splash.png',fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
