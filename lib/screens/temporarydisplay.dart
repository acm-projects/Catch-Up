import 'package:catch_up/screens/camerapage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/featurebuttonsview.dart';
import 'cloudrecordlistview.dart';
class TemporaryPage extends StatefulWidget {
  //static late

 
  final String filePath;
  TemporaryPage({Key? key, required this.filePath}) : super(key: key);
  @override
  _TemporaryPageState createState() => _TemporaryPageState();
}




class _TemporaryPageState extends State<TemporaryPage> {
  late VideoPlayerController _videoPlayerController;
List<Reference> references = [];
 final List<String> urls = [];


@override
void initState() {
  super.initState();
  _onUploadComplete();
}

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _onUploadComplete() async {  //String url
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  ListResult listResult =
    await firebaseStorage.ref().child('upload-video-firebase').list();
  setState(() {
    references = listResult.items;
    //urls.add(url);
  });
 }


  // Future _initVideoPlayer() async {
  //   final _url = await downloadVideoURL();
  //   _videoPlayerController = VideoPlayerController.network(_url); //
  //   await _videoPlayerController.initialize();
  //   await _videoPlayerController.setLooping(false);
  //   await _videoPlayerController.play();
  // }
  late Future<void> initializeVideoPlayerFuture;


  void _initPlayer() async {
    final _url = await downloadVideoURL();
    _videoPlayerController = VideoPlayerController.network(_url);
    initializeVideoPlayerFuture = _videoPlayerController.initialize();
    setState(() {});
  }


@override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}



