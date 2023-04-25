import 'package:catch_up/screens/camerapage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/featurebuttonsview.dart';
import 'cloudrecordlistview.dart';
class VideoPage extends StatefulWidget {
  //static late

 
  final String filePath;
  VideoPage({Key? key, required this.filePath}) : super(key: key);
  @override
  _VideoPageState createState() => _VideoPageState();
}
class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
List<Reference> references = [];
 final List<String> urls = [];
 //String url = "123";


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
  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath)); 
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
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

@override
Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Example'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: FutureBuilder(
                future: _initVideoPlayer(),
                builder: (context, state) {
                  if (state.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return VideoPlayer(_videoPlayerController);
                  }
                },
              ),
              // references.isEmpty
              //     ? Center(
              //         child: Text('No File uploaded yet'),
              //       )
              //     : CloudRecordListView(
              //         references: references, filePath: widget.filePath,
              //       ),
            ),
            Expanded(
              flex: 2,
              child: FeatureButtonsView(
                onUploadComplete: _onUploadComplete, filePath: widget.filePath, 
                //urls: urls,
              ),
            ),
          ],
        ),
      ),
    );
  }
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Preview'),
//       elevation: 0,
//       backgroundColor: Colors.black26,
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.check),
//           onPressed: () {
//           },
//         )
//       ],
//     ),
//     extendBodyBehindAppBar: true,
//     body: FutureBuilder(
//       future: _initVideoPlayer(),
//       builder: (context, state) {
//         if (state.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return VideoPlayer(_videoPlayerController);
//         }
//       },
//     ),
//   );
//   }
}

// import 'package:catch_up/Theme/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:io';
// import 'package:flutter_animated_button/flutter_animated_button.dart';

// class VideoPage extends StatefulWidget {
//   final String filePath;

//   const VideoPage({Key? key, required this.filePath}) : super(key: key);

//   @override
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   late VideoPlayerController _videoPlayerController;

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     super.dispose();
//   }

//   Future _initVideoPlayer() async {
//     _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
//     await _videoPlayerController.initialize();
//     await _videoPlayerController.setLooping(true);
//     await _videoPlayerController.play();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Preview',
//           style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
//         ),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor: MainColor.DarkPink,
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.check,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               print('do something with the file');
//             },
//           )
//         ],
//       ),
//       extendBodyBehindAppBar: true,
//       body: FutureBuilder(
//         future: _initVideoPlayer(),
//         builder: (context, state) {
//           if (state.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             return VideoPlayer(_videoPlayerController);
//           }
//         },
//       ),
//     );
//   }
// }
