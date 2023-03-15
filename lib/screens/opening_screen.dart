import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:catch_up/Widgets/widgetTree.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/splash.png'),
          const Text(
            'Catch Up',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(130, 185, 119, 1),
      nextScreen: const WidgetTree(),
      splashIconSize: 250,
    );
  }
}
