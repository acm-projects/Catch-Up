// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:catch_up/screens/send_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/videopage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

/*
For merging videos:
- merge as each video uploads
- return the final video at release time


*/

class FeatureButtonsView extends StatefulWidget {
  final Function onUploadComplete;
  final String filePath;
  const FeatureButtonsView({
    Key? key,
    required this.onUploadComplete,
    required this.filePath,
  }) : super(key: key); // requires the file path
  @override
  State<FeatureButtonsView> createState() => _FeatureButtonsViewState();
}

class _FeatureButtonsViewState extends State<FeatureButtonsView> {
  late bool _isPlaying;
  late bool _isUploading;
  late bool _isRecorded;
  late bool _isRecording;
  // String _filePath = widget.filePath;
  late VideoPlayerController _videoPlayerController;
  late CameraController _cameraController;
  @override
  void initState() {
    // initialize bools to false
    super.initState();
    _isPlaying = false;
    _isUploading = false;
    _isRecorded = false;
    _isRecording = false;
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
  }

  Widget build(BuildContext context) {
    return Center(
        child: _isUploading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: LinearProgressIndicator()),
                  Text('Uplaoding to Firebase'),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.replay),
                  //   onPressed: _onRecordAgainButtonPressed,
                  // ),
                  // IconButton(
                  //   icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  //   onPressed: _onPlayButtonPressed,
                  // ),

                  //Upload

//sign in button
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0),
                    child: ElevatedButton(
                      onPressed: _onFileUploadButtonPressed,
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          backgroundColor: const Color(0xff82B977),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.upload),
                          Text(
                            'Upload',
                            style: TextStyle(
                              color: const Color(0xffEFEDE7),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
        //  :  IconButton(
        //       icon: _isRecording
        //           ? Icon(Icons.pause)
        //           : Icon(Icons.fiber_manual_record),
        //       onPressed: _onRecordButtonPressed,
        //     ),
        );
  }

//Uploads Video File to Firebase
  Future<void> _onFileUploadButtonPressed() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    setState(() {
      _isUploading = true;
    });
    try {
      await firebaseStorage
          .ref('upload-video-firebase')
          .child(widget.filePath.substring(
              widget.filePath.lastIndexOf('/'), widget.filePath.length))
          .putFile(File(widget.filePath));
      widget.onUploadComplete();
    } catch (error) {
      // error, only execute if it does not upload
      print('Error occured while uplaoding to Firebase ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured while uplaoding'),
        ),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SendPage();
        },
      ),
    );
  }

  // void _onRecordAgainButtonPressed() {
  //   setState(() {
  //     _isRecorded = false;
  //   });
  // }
  Future<void> _onRecordButtonPressed() async {
    if (_isRecording) {
      final file = await _cameraController
          .stopVideoRecording(); // stop the video recording
      _isRecording = false;
      _isRecorded = true;
    } else {
      _isRecorded = false;
      _isRecording = true;
      await _startRecording();
    }
    setState(() {});
  }

  // void _onPlayButtonPressed() {
  //   if (!_isPlaying) {
  //     _isPlaying = true;
  //  _videoPlayerController.initialize();
  //  _videoPlayerController.setLooping(true); // pause or loop? fix later
  //  _videoPlayerController.play();
  //       setState(() {
  //         _isPlaying = false;
  //       });
  //   } else {
  //     _videoPlayerController.pause();
  //     _isPlaying = false;
  //   }
  //   setState(() {});
  // }
  Future<void> _startRecording() async {
    if (_isRecorded) {
      // true ?
      Directory directory = await getApplicationDocumentsDirectory();
      String filepath = directory.path +
          '/' +
          DateTime.now().millisecondsSinceEpoch.toString() +
          '.mp4';
      _videoPlayerController =
          VideoPlayerController.file(File(widget.filePath));
      //FlutterAudioRecorder2(filepath, audioFormat: AudioFormat.AAC);
      await _videoPlayerController.initialize;
      _videoPlayerController.play();
      //_filePath = filepath;
      setState(() {});
    } else {
      content:
      Center(child: Text('The video was not able to be recorded'));
    }
  }
}
