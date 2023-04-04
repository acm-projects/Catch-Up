import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:catch_up/models/user.dart';


class OurDatabase{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retVal = "error";

    Map<String, dynamic> userDataToAdd = {
      'uid': user.uid,
      'email': user.email,
    };

    try{
      await _firestore.collection('users').doc(user.uid).set(userDataToAdd); //add user data to user doc in users collection
      retVal = "success";
    } catch(e) {
      print(e);
    }

    return retVal;
  }

}