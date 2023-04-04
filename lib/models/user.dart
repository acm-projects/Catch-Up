import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  late String email;
  late String uid;
  late String name;
  List<String> groupsList = [];
  
  OurUser() {
    this.email = email;
    this.uid = uid;
    this.groupsList;
  }

}