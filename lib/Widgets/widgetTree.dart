import 'package:catch_up/services/auth.dart'; //auth services class
import 'package:flutter/material.dart'; 
import 'package:catch_up/screens/homepage.dart';
import 'package:catch_up/screens/login_register_page.dart'; //login and register page

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {    
        if (snapshot.hasData) {       //If user, will go into homepage
          return HomePage();
        } else {                      //If not, will go into LoginPage
          return const LoginPage();
        }
      },
    );
  }
}
