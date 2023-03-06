import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() =>  _SignInState();
}

class  _SignInState extends State <SignIn> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold (
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Catch Up')
      ),
      body: Container(
        padding: EdgeInsets.symmetric()
      )
    );
  }
}