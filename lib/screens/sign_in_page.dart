// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/home.dart';
import 'package:catch_up/screens/homepage.dart';
import 'package:catch_up/screens/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catch_up/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? errorMessage = '';
  bool isLogin = true;

  //Text Editing for Email and Password
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  //Sign In
  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthService().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((BuildContext context) {
      return const Home();
    })));
  }

  //Register
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await AuthService().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      //obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          //fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
        border: InputBorder.none,
        hintText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Uh oh ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEDE7),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bubbles-2.png'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),

                //back arrow
                Padding(
                  padding: const EdgeInsets.only(right: 325),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffEFEDE7),
                    ),
                  ),
                ),

                //logo
                Image.asset(
                  'assets/cream-logo.png',
                  height: 109,
                  width: 109,
                ),

                SizedBox(height: 10),

                //Catch up + motto
                Text('catch up',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 64,
                      fontFamily: 'Cartis-Beautyful-serif',
                      color: Color(0xffEFEDE7),
                    )),
                //SizedBox(height: 5),
                Text('never miss a moment.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'Cartis-Beautyful-serif',
                      color: Color(0xffEFEDE7),
                    )),

                SizedBox(height: 120),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffD79784),
                      //border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _entryField('Email*', _controllerEmail)
                        /*TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            //fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          border: InputBorder.none,
                          hintText: 'Email*',
                        ),
                      ),*/
                        ),
                  ),
                ),

                //Spacing between the two boxes
                SizedBox(height: 20),

                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffD79784),
                      //border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _entryField('Password*', _controllerPassword)
                        /*TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            //fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          border: InputBorder.none,
                          hintText: 'Password*',
                        ),
                      ),*/
                        ),
                  ),
                ),

                SizedBox(height: 25),

                //sign in button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: ElevatedButton(
                    onPressed: signInWithEmailAndPassword,
                    //isLogin = true;

                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: const Color(0xff82B977),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: const Color(0xffEFEDE7),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
