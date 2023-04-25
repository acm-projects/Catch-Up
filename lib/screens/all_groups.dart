// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:catch_up/screens/individual_group_catchup.dart';
import 'package:catch_up/screens/random_group1.dart';
import 'package:catch_up/screens/random_group2.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/screens/individual_group.dart';
import 'random_group3.dart';
import 'random_group4.dart';

import 'join_add_group.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key}) : super(key: key);

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  String? errorMessage = '';
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEDE7),
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
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
                    color: Color(0xffD79784),
                  ),
                ),
              ),

              //Header box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  width: 310.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xffD79784),
                  ),
                  child: Column(
                    children: [
                      //space before the logo
                      SizedBox(height: 20),

                      //logo
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/cream-logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //space between logo and text
                      SizedBox(height: 10),

                      const Text(
                        'Groups',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 42,
                          fontFamily: 'Cartis-Beautyful-serif',
                          color: Color(0xffEFEDE7),
                        ),
                      ),

                      //space between text and bottom of box
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  height: 25,
                  width: 350.0,
                  decoration: const BoxDecoration(
                    color: Color(0xffEFEDE7),
                  ),
                ),
              ),

              //sliding cards
              SizedBox(
                height: 555,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    //SizedBox(height: 25),
                    //card #1
                    //first divider
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                    SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const ExistingGroup();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xff8D79784),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/acm-logo.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'ACM Overlords',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 43),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //divider under group 1
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //card #2
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const RandomGroup1();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xffD79784),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/basketball.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'Basketball',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 100),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //divider under group 2
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //card #3
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const RandomGroup2();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xffD79784),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/roommates.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'Roommates',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 81),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //divider under group 3
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //card #4

                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const RandomGroup3();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xffD79784),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/group1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'Familia',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 140),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //second divider
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //card #5
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const RandomGroup4();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xffD79784),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/cs1337.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'CS 1337',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 122),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //second divider
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    //card #6
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const GroupCatchUp();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      //how the card looks
                      child: Container(
                        width: 350.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            //avatar
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  // border color and width around the profile image
                                  width: 4,
                                  color: Color(0xff82B977),
                                ),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage('assets/hateclubpfp.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            const Text(
                              'Ridwan Hate Club',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                fontFamily: 'Poppins',
                                color: Color(0xff82B977),
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //second divider
                    SizedBox(height: 10),
                    Divider(
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),

                    SizedBox(height: 20),

                    FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const JoinAddGroup();
                        })));
                      },
                      backgroundColor: Color(0xffD79784),
                      child: const Icon(Icons.add, color: Color(0xffEFEDE7)),
                    ),

                    SizedBox(height: 30),

                    //end of all 6 cards for now
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
