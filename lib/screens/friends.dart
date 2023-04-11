// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:catch_up/screens/sign_in_page.dart';
import 'package:flutter/material.dart';

import 'all_groups.dart';
import 'sign_up_page.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffEFEDE7),
        extendBody: true,
        body: SafeArea(
          child: Center(
              child: Column(
            children: <Widget>[
              SizedBox(height: 10),

              //back arrow
              Padding(
                padding: const EdgeInsets.only(right: 325),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xffD79784),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
