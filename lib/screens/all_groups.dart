// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unnecessary_new, sort_child_properties_last, sized_box_for_whitespace, library_private_types_in_public_api

import 'package:catch_up/screens/home.dart';
import 'package:flutter/material.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key}) : super(key: key);

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  String? errorMessage = '';
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEFEDE7),
      body: SafeArea(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              //Header box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  width: 310.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xffD79784),
                  ),
                  child: Column(
                    children: [
                      //space before the logo
                      SizedBox(height: 20),

                      //logo
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/cream-logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //space between logo and text
                      SizedBox(height: 10),

                      const Text(
                        'Groups',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 42,
                          fontFamily: 'Cartis-Beautyful-serif',
                          color: Color(0xffEFEDE7),
                        ),
                      ),

                      //space between text and bottom of box
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Column(
                children: [
                  SizedBox(
                    height: 500,
                    width: 400,
                    child: ListView(
                      children: const <Widget>[
                        //change to method if time so we can add new groups

                        SizedBox(height: 50),
                        Card(
                          elevation: 0,
                          color: Color(0xffEFEDE7),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 40.0,
                              backgroundColor: Color(0xff82B977),
                              child: CircleAvatar(
                                radius: 35.0,
                                backgroundImage:
                                    AssetImage('assets/group1.png'),
                              ),
                            ),
                            title: Text(
                              'Group #1',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                fontSize: 26,
                                color: Color(0xff82B977),
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff82B977),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          indent: 30,
                          endIndent: 30,
                        )),
                      ],
                    ),
                  ),
                ],
              ),

              //Groups text with dividers
              // Expanded(
              //     child: Divider(
              //   thickness: 1,
              //   indent: 30,
              //   endIndent: 30,
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
