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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
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
                const SizedBox(height: 17),
                const Text(
                  'Share a voice note with',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Group 1',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Color(0xffD79784),
                  ),
                ),
                const SizedBox(height: 440),
                const Text(
                  'Tap here to start recording',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: Color(0xffEFEDE7),
                  ),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color(0xffEFEDE7),
                  child:
                      const Icon(Icons.mic, color: Color(0xffB9D3AF), size: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
