// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:catch_up/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catch_up/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; //firestore

class SignUpPage extends StatefulWidget {
  static late String uid;
  static late String name;

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? errorMessage = '';
  bool isLogin = true;

//Text Controllers
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();

  ///Register
  Future<void> createUserWithEmailAndPassword() async {
    try {
      //create User for Auth
      await AuthService().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      //Data to save in a user's document
      Map<String, dynamic> userDataToSave = {
        'email': _controllerEmail.text,
        'name': _controllerName.text,
      };
      SignUpPage.name = _controllerName.text;

      //Add user data to user document in user collection
      DocumentReference _docRef =
          await _firestore.collection('users').add(userDataToSave);
      SignUpPage.uid = _docRef.id;
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
      onPressed: createUserWithEmailAndPassword,
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
                  //top spacing
                  //SizedBox(height: 10),

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

                  //SizedBox(height: 10),

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

                  SizedBox(height: 90),

                  //name textfield
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
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                            hintText: 'Full Name*',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Spacing between the two boxes
                  SizedBox(height: 10),

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
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                            hintText: 'Email*',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Spacing between the two boxes
                  SizedBox(height: 10),

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
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                            hintText: 'Password*',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Spacing between the two boxes
                  SizedBox(height: 10),

                  //Re-enter password textfield
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
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                            hintText: 'Re-enter Password*',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Spacing between the two boxes
                  SizedBox(height: 20),

                  SizedBox(height: 25),

                  //sign in button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
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

                  //register button
                ],
              ),
            ),
          ),
        ));
  }
}
