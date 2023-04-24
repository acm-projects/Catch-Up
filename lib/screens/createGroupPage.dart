import 'package:catch_up/models/groups.dart';
import 'package:catch_up/screens/groupspage.dart';
import 'package:catch_up/screens/homepage.dart';
import 'package:catch_up/screens/login_register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catch_up/services/currentUser.dart';


/*
Complete:
- create a group in firebase 
   - uid added to group members list
   - group id added to user's group collection
- join a group in firebase
   - uid added to group members list
   - group id added to user's group collection

To do:
- max 5 members per group
- QR code to join group
- a way to get a user's groups from firebase and display them all on a page
- error message if group Id is wrong 

*/



class CreateGroup extends StatefulWidget {
  static late String groupId; 
  const CreateGroup({Key? key}) : super(key: key);



  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {

  final TextEditingController _groupName = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool works = true;
  //String uid =  LoginPage.uid;
  
 
  Future<void> createGroup() async { //move to database.dart
    //String uid = _auth.currentUser!.uid; //gets uid from firebase
    
    String uid = LoginPage.uid; //get uid from createUser function 

    //add user's uid to the list of members
    List<String> members = [];
    members.add(uid);
    
    Map<String, dynamic> groupDataToSave = {
      'groupName': _groupName.text,
      'members': members, 
    };

    //add group to groups collection
    DocumentReference _docRef = await _firestore.collection('groups').add(groupDataToSave); //DocRef is so we can get groupId from firebase
    CreateGroup.groupId = _docRef.id;
    
    //add group to group collection in user's collection
    _firestore.collection('users').doc(uid).collection('groups').add({
      'groupName': _groupName.text,
      'groupId': CreateGroup.groupId,
    });

    //generate qr code

  }
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar (
        title: Text("Group Name"), 
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
                controller: _groupName,
                decoration: InputDecoration(
                  hintText: "Enter Group Name",
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
            child: Text("Create Group"),
            onPressed: () {
              //save group to firebase
              createGroup();

              //Navigate to groups page
              Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return GroupsPage(); //returns home page originally
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
