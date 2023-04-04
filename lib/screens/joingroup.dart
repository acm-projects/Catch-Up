import 'package:catch_up/screens/homepage.dart';
import 'package:catch_up/screens/login_register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class JoinGroup extends StatefulWidget {
  const JoinGroup({Key? key}) : super(key: key);

  @override
  State<JoinGroup> createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  final TextEditingController _groupId = TextEditingController(); //to enter group Id user is joining
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  
   void joinGroup() async {
    //String uid = _auth.currentUser!.uid; //gets uid from firebase

    String uid = LoginPage.uid;
    //String groupId = _groupId.text;
  
    //add user uid to a members list
    List<String> members = [];
    members.add(uid);

    //update members list in group's doc in groups collection
    await _firestore.collection('groups').doc(_groupId.text).update({
        'members': FieldValue.arrayUnion(members), //adds list of one member to array of members
    });

    //add group to groups collection in user collection
    Map<String, dynamic> userDataToSave = {
      //'groupName': _groupName.text,
      'grouId': _groupId.text,
    };

    //add group to user's groups collection
    await _firestore.collection('users').doc(uid).collection('groups').add(userDataToSave); //how do I access a specific user's document

  }
 

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar (
        title: Text("Group Id"), 
      ),
      body: isLoading? Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ): Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            height: size.height /14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height / 14,
              width: size.width/1.15,
              child: TextField(
                controller: _groupId,
                decoration: InputDecoration(
                  hintText: "Enter Group Id",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                )
              )
            )
          ),
          SizedBox(
            height: size.height / 50, 
          ),
          ElevatedButton(
            child: Text("Join Group"),
            onPressed: () {
              joinGroup();
              //Navigate to groups page
              Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomePage(); //returns home page originally
                            },
                          ),
                        );
            }
          )
        ]
        )
        );
  }
}