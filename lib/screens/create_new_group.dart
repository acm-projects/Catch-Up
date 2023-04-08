// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CreateNewGroup extends StatefulWidget {
  const CreateNewGroup({Key? key}) : super(key: key);

  @override
  State<CreateNewGroup> createState() => _CreateNewGroupState();
}

class _CreateNewGroupState extends State<CreateNewGroup> {
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
