// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:catch_up/screens/create_new_group.dart';
import 'package:catch_up/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'join_group_page.dart';
import 'sign_up_page.dart';

class JoinAddGroup extends StatefulWidget {
  const JoinAddGroup({Key? key}) : super(key: key);

  @override
  State<JoinAddGroup> createState() => _JoinAddGroupState();
}

class _JoinAddGroupState extends State<JoinAddGroup> {
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

                  SizedBox(height: 150),

                  //Join group button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 315,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                //change to new page
                                return const JoinGroupPage();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            backgroundColor: const Color(0xff82B977),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Text(
                          'Join Group',
                          style: TextStyle(
                            color: const Color(0xffEFEDE7),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Spacing between the two buttons
                  SizedBox(height: 5),

                  Row(
                    children: [
                      //left line
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        indent: 60,
                        endIndent: 5,
                      )),

                      Text('or',
                          style: TextStyle(
                            color: Color(0xffC3C3C3),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          )),

                      //right line
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        endIndent: 60,
                        indent: 5,
                      )),
                    ],
                  ),

                  SizedBox(height: 5),

                  //New group button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: 315,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                //change route
                                return const CreateNewGroup();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            backgroundColor: const Color(0xffD79784),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Text(
                          'Create New Group',
                          style: TextStyle(
                            color: const Color(0xffEFEDE7),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
