// ignore_for_file: prefer_const_constructors

import 'package:catch_up/screens/chewie_item.dart';
import 'package:catch_up/screens/friends.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'home.dart';
import 'join_group_page.dart';
import 'package:chewie/chewie.dart';

class GroupCatchUp extends StatefulWidget {
  const GroupCatchUp({super.key});

  @override
  State<GroupCatchUp> createState() => _GroupCatchUpState();
}

class _GroupCatchUpState extends State<GroupCatchUp> {
  Widget build(BuildContext context) {
    int totalTime = (24 * 3600) + (0 * 60) + 15;
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
                  'Ridwan Hate Club',
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
                  height: 150,
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
                          width: 390.0,
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
                                        image: AssetImage('assets/ridwan.jpg'),
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
                                        image: AssetImage('assets/gabby.jpg'),
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
                                        image: AssetImage('assets/reiki.jpg'),
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
                                        image: AssetImage('assets/kanchan.jpg'),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //end of avatars

                SizedBox(height: 10),
                Container(
                  height: 240,
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
                      SizedBox(height: 25),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            'assets/cream-logo.png',
                            height: 75,
                            width: 75,
                          ),
                          SizedBox(width: 20),
                          const Text(
                            'Next catch up in . . .',
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
                ),

                //movie preview box
                SizedBox(height: 30),
                Container(
                  height: 180,
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
                  child: Center(
                    child: ChewieListItem(
                      videoPlayerController: VideoPlayerController.asset(
                        'assets/selfie.mp4',
                      ),
                      looping: true,
                      key: null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                        'Generate QR Code',
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
      ),
    );
  }
}
