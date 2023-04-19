// ignore_for_file: prefer_const_constructors

import 'package:catch_up/screens/all_groups.dart';
import 'package:catch_up/screens/friends.dart';
import 'package:catch_up/screens/individual_group_catchup.dart';
import 'package:catch_up/screens/main_profile.dart';
import 'package:catch_up/screens/home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class IndividualGroup extends StatefulWidget {
  const IndividualGroup({super.key});

  @override
  State<IndividualGroup> createState() => _IndividualGroupState();
}

class _IndividualGroupState extends State<IndividualGroup> {
  @override
  Widget build(BuildContext context) {
    int totalTime = (3 * 3600) + (30 * 60) + 15;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEDE7),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Top.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
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

                const SizedBox(height: 5),
                const Text(
                  'Group #1',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                SizedBox(height: 30),
                //avatars
                SizedBox(
                  height: 200,
                  width: 520,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      //clicking on a user avatar will take you to the friends page
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((BuildContext context) {
                            return const FriendsPage();
                          })));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Container(
                          width: 520.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              //avatar
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Safa',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 25),

                              //group member 2
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Kanchan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 25),

                              //group member 3
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Ridwan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 25),

                              //group member 4
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Reiki',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 25),

                              //group member 5
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Gabby',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(width: 25),

                              //group member 6
                              Column(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        // border color and width around the profile image
                                        width: 4,
                                        color: Color(0xffE9CFC3),
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage('assets/group1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Text(
                                    'Jessie',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Color(0xffEFEDE7),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //end of avatars

                SizedBox(height: 25),
                Container(
                  height: 270,
                  width: 366,
                  decoration: BoxDecoration(
                      color: Color(0xffD79784),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 10),
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            'assets/cream-logo.png',
                            height: 75,
                            width: 75,
                          ),
                          SizedBox(width: 10),
                          const Text(
                            'Catch up in . . .',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 27,
                              fontFamily: 'Cartis-Beautyful-serif',
                              color: Color(0xffEFEDE7),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CountdownTimer(
                        duration: totalTime,
                      ),
                      /*
                      const Text(
                        '7:31 hours',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 64,
                          fontFamily: 'Cartis-Beautyful-serif',
                          color: Color(0xffEFEDE7),
                          shadows: [
                            Shadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                // ignore: use_full_hex_values_for_flutter_colors
                                color: Color(0xff40000000))
                          ],
                        ),
                      ),*/
                      SizedBox(height: 10),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(width: 95),
                          Text(
                            'Group ID: ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              color: Color(0xffEFEDE7),
                            ),
                          ),
                          Text(
                            'GR567H ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              fontFamily: 'Poppins',
                              color: Color(0xffB9D3AF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
