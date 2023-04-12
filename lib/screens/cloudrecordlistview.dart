import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
class CloudRecordListView extends StatefulWidget {
  final List<Reference> references;
    final String filePath;
  const CloudRecordListView({
    Key? key,
    required this.references, required this.filePath,
  }) : super(key: key);
  @override
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}
class _CloudRecordListViewState extends State<CloudRecordListView> {
  bool? isPlaying;
   late VideoPlayerController _videoPlayerController;
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    isPlaying = false;
      _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    selectedIndex = -1;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.references.length,
      reverse: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(widget.references.elementAt(index).name),
          trailing: IconButton(
            icon: selectedIndex == index
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow),
            onPressed: () => _onListTileButtonPressed(index),
          ),
        );
      },
    );
  }
  Future<void> _onListTileButtonPressed(int index) async {
    setState(() {
      selectedIndex = index;
    });
    _videoPlayerController.play(); // play a specific video
    // audioPlayer.onPlayerCompletion.listen((duration) {
    //   setState(() {
    //     selectedIndex = -1;
    //   });
   // });
  }
}