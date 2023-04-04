import 'package:catch_up/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrentUser {
  OurUser _currentUser = OurUser();
  OurUser get getCurrentUser => _currentUser;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getUserInfo() async {
    String retVal = "error";
  try {
  User? _firebaseUser = _auth.currentUser; //gets state of current user
    if (_firebaseUser != null) {
      _currentUser.uid = _firebaseUser.uid;  //gets user's uid
      _currentUser.email = _firebaseUser.email!;  ///gets user's email
      retVal = "success";
    }
  } catch (e) {
      print(e);
    }
  return retVal;
  }

  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}