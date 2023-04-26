import 'package:catch_up/screens/login_register_page.dart';
import 'package:catch_up/screens/qrscannerpage.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//need to get name of group from firebase and display on page depending on groupId from qrcode


class QRJoinGroup extends StatefulWidget {
  //final String groupId; //groupId
  //final Function() screenClosed;
  const QRJoinGroup({
    Key? key,
    //required this.groupId, //group Id
    //required this.screenClosed,
  }) : super(key: key);

  @override
  State<QRJoinGroup> createState() => _QRJoinGroupState();
}


class _QRJoinGroupState extends State<QRJoinGroup> {
  //go into firebase and find the document matching the group Id and get the group name
  //display the group name at the top of page and join button on the button
  //when the join button is pressed, group is added to user's doc, and user is added to group's members list
      //and goes to that individual group'a page

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future <void> joinGroup() async {
    String uid = LoginPage.uid;
  
    //add user uid to a members list
    List<String> members = [];
    members.add(uid);

    //update members list in group's doc in groups collection
    await _firestore.collection('groups').doc(ScannerPage.id).update({
        'members': FieldValue.arrayUnion(members), //adds list of one member to array of members
    });

    //add group to groups collection in user collection
    Map<String, dynamic> userDataToSave = {
      //'groupName': _groupName.text,
      'grouId': ScannerPage.id,
    };

    //add group to user's groups collection
    await _firestore.collection('users').doc(uid).collection('groups').add(userDataToSave); 

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Found Code"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //widget.screenClosed();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined,),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Scanned Code:", style: TextStyle(fontSize: 20,),),
              SizedBox(height: 20,),
              Text(ScannerPage.id, style: TextStyle(fontSize: 16,),),
            ],
          ),
        ),
      ),
    );
  }
}