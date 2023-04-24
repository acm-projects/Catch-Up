// ignore_for_file: prefer_const_constructors

import 'package:catch_up/screens/friends.dart';
import 'package:catch_up/screens/join_add_group.dart';
import 'package:catch_up/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catch_up/services/auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final User? user = AuthService().currentUser;

  Future<void> signOut() async {
    await AuthService().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'ridwan.amin41@gmail.com',
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
          fontStyle: FontStyle.italic,
          color: Colors.white),
    );
  }

  Widget _userName() {
    return Text(
      'Ridwan Amin',
      style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cartis-Beautyful-serif',
          color: Colors.white),
    );
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(130, 185, 119, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        // border color and width around the profile image
                        width: 4,
                        color: Colors.white,
                      ),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/ridwan.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15, // creates space between text and profile image
            ),
            Center(
              child: _userName(),
            ),
            const SizedBox(
              height: 6, // creates space between text and profile image
            ),
            Center(
              child: _userUid(),
            ),
            const SizedBox(
              height: 40, // space between profile pic and first text field
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                  left: 16, top: 50, right: 16, bottom: 150),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //edit profile button
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      //make it go to group page
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const EditProfilePage();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(right: 100, left: 20),
                          backgroundColor: const Color(0xffD79784),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Color(0xffEFEDE7),
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  //Friends button
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      //make it go to group page
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const FriendsPage();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(right: 100, left: 20),
                          backgroundColor: const Color(0xffD79784),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.people_alt_rounded,
                            color: Color(0xffEFEDE7),
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Friends',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  //Join group button
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      //make it go to group page
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((BuildContext context) {
                          return const JoinAddGroup();
                        })));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(right: 100, left: 20),
                          backgroundColor: const Color(0xffD79784),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.group_add_rounded,
                            color: Color(0xffEFEDE7),
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Join Group',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: signOut,
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            backgroundColor: Color(0xff82B977),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22))),
                        child: const Text(
                          'Sign Out',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
