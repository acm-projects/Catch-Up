import 'package:flutter/material.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({super.key});

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffB9D3AF),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                //back arrow
                Padding(
                  padding: const EdgeInsets.only(right: 325),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xffEFEDE7),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                const Text(
                  'What\'s on your mind?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Share a voice note with your friends',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Color(0xffD79784),
                  ),
                ),
                const SizedBox(height: 7),
                // const Text(
                //   'Group 1',
                //   style: TextStyle(
                //     fontWeight: FontWeight.w900,
                //     fontSize: 20,
                //     fontFamily: 'Poppins',
                //     color: Color(0xffD79784),
                //   ),
                // ),
                const SizedBox(height: 470),
                const Text(
                  'Tap here to start recording',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color(0xffEFEDE7),
                    child: const Icon(
                      Icons.mic,
                      color: Color(0xffB9D3AF),
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
