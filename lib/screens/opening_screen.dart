// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:catch_up/Widgets/widgetTree.dart';
import 'package:catch_up/screens/login_options.dart';
import 'package:catch_up/screens/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'login_register_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/Background.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/cream-logo.png',
                  height: 109,
                  width: 109,
                ),
                SizedBox(height: 5),
                const Text(
                  'catch up',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Cartis-Beautyful-serif',
                    //fontWeight: FontWeight.normal,
                    color: Color(0xffEFEDE7),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      nextScreen: const WidgetTree(),
      splashIconSize: double.infinity,
    );
  }
}
