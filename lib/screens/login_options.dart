// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 30),

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

                  SizedBox(height: 100),

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
                            hintText: 'Email',
                          ),
                        ),
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
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  //sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xff82B977),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: const Color(0xffEFEDE7),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      )),
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
