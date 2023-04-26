// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:catch_up/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/screens/individual_group.dart';

import 'home.dart';
import 'join_add_group.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool click1 = false;
  bool click2 = false;
  bool click3 = false;
  bool click4 = false;
  bool click5 = false;
  bool click6 = false;

  @override
  Widget build(BuildContext context) {
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

                //Header box
                Column(
                  children: [
                    //logo
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/cream-logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //space between text and bottom of box
                    SizedBox(height: 20),
                  ],
                ),

                //sliding cards
                SizedBox(
                  height: 585,
                  width: 400,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      //card #1
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click1 = !click1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                      image: AssetImage('assets/acm-logo.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                const Text(
                                  'ACM Overlords',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  (click1 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //card #2
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click2 = !click2;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                      image:
                                          AssetImage('assets/basketball.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                const Text(
                                  'Basketball',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 75),
                                Icon(
                                  (click2 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //card #3
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click3 = !click3;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                SizedBox(width: 20),
                                const Text(
                                  'Roommates',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 57),
                                Icon(
                                  (click3 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //card #4
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click4 = !click4;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                SizedBox(width: 20),
                                const Text(
                                  'Familia',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 112),
                                Icon(
                                  (click4 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //card #5
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click5 = !click5;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                SizedBox(width: 20),
                                const Text(
                                  'CS 1337',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 97),
                                Icon(
                                  (click5 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      //card #6
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            click6 = !click6;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        //how the card looks
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          child: Container(
                            height: 100,
                            width: 350,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14),
                              ),
                              color: Color(0xffE9CFC3),
                            ),
                            child: Row(
                              children: [
                                //avatar
                                SizedBox(width: 10),
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
                                      image:
                                          AssetImage('assets/hateclubpfp.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                const Text(
                                  'Ridwan Hate Club',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Poppins',
                                    color: Color(0xffEFEDE7),
                                  ),
                                ),
                                SizedBox(width: 11),
                                Icon(
                                  (click6 == false)
                                      ? Icons.radio_button_unchecked
                                      : Icons.check_circle,
                                  color: Color(0xffEFEDE7),
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 130.0),
                        child: SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const Home();
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
                            child: Row(
                              children: [
                                SizedBox(width: 25),
                                Text(
                                  'Send',
                                  style: TextStyle(
                                    color: const Color(0xffEFEDE7),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(width: 15),
                                Icon(
                                  Icons.send,
                                  color: Color(0xffEFEDE7),
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      //end of all 6 cards for now
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
