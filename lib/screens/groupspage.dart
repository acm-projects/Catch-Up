import 'package:catch_up/screens/joingroup.dart';
import 'package:catch_up/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catch_up/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key}) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    bool isLoading = true;

    List groupsList = [];

  void getAvailableGroups() async {  //get groups from firebase
      String uid = _auth.currentUser!.uid; //gets the current user's uid and sets it to string uid

      await _firestore    
        .collection('users')  //gets users collection
        .doc(uid)     //gets document specified by user's uid
        .collection('groups')   //gets groups collection
        .get()
        .then((value) {
          setState(() {
            groupsList = value.docs;  
            isLoading = false;   //once data is saved, it stops loading
           }); //saves data to groups list in firebase
        });
  }



  Widget _title() {
    return const Text('Groups Page');
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return JoinGroup();
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
                      'Join Group',
                      style: TextStyle(
                        color: const Color(0xffEFEDE7),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     _userUid(),
        //     _signOutButton(),
        //   ],
        // ), 
      ),
      //just a test button to take you to edit profile page
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const EditProfilePage();
              },
            ),
          );
        },
      ),
    );
  }
}
