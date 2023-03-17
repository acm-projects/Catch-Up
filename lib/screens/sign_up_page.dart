// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:catch_up/screens/homepage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  SizedBox(height: 15),

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
