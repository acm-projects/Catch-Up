import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup {
  late String groupName;
  List<String> membersList = [];

  OurGroup(String groupName) {
     this.groupName = groupName;
     this.membersList;
  }

}