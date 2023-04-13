import 'dart:io';
import 'package:catch_up/Theme/theme.dart';
import 'package:catch_up/screens/videopage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

// create a class for camerapage
// initialization
class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  @override
  _CameraPageState createState() => _CameraPageState();
}

// new class for loading page
class _CameraPageState extends State<CameraPage> {
  bool _isLoading = true;
  bool _isRecording = false;
  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  late CameraController _cameraController;
  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<String?> _startVideoRecording() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    // Do nothing if a recording is on progress
    if (_cameraController.value.isRecordingVideo) {
      return null;
    }
    //get storage path
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/${currentTime}.mp4';
    try {
      await _cameraController.startVideoRecording();
    } on CameraException catch (e) {
      return null;
    }
    //gives you path of where the video was stored
    return filePath;
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await _cameraController.stopVideoRecording();
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPage(filePath: file.path),
      );
      Navigator.push(context, route);
    } else {
      await _cameraController.prepareForVideoRecording();
      await _startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // if camera page is loading, display loading page
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(_cameraController),
            Padding(
              padding: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: MainColor.DarkPink,
                child: Icon(_isRecording ? Icons.stop : Icons.circle),
                onPressed: () => _recordVideo(),
              ),
            ),
          ],
        ),
      );
    }
  }
}

// import 'package:catch_up/screens/videopage.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:catch_up/Theme/theme.dart';

// // create a class for camerapage
// // initialization
// class CameraPage extends StatefulWidget {
//   const CameraPage({Key? key}) : super(key: key);

//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// // new class for loading page
// class _CameraPageState extends State<CameraPage> {
//   bool _isLoading = true;
//   bool _isRecording = false;
//   _initCamera() async {
//     final cameras = await availableCameras();
//     final front = cameras.firstWhere(
//         (camera) => camera.lensDirection == CameraLensDirection.front);
//     _cameraController = CameraController(front, ResolutionPreset.max);
//     await _cameraController.initialize();
//     setState(() => _isLoading = false);
//   }

//   late CameraController _cameraController;

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   _recordVideo() async {
//     if (_isRecording) {
//       final file = await _cameraController.stopVideoRecording();
//       setState(() => _isRecording = false);
//       final route = MaterialPageRoute(
//         fullscreenDialog: true,
//         builder: (_) => VideoPage(filePath: file.path),
//       );
//       Navigator.push(context, route);
//     } else {
//       await _cameraController.prepareForVideoRecording();
//       await _cameraController.startVideoRecording();
//       setState(() => _isRecording = true);
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoading) {
//       // if camera page is loading, display loading page
//       return Container(
//         color: Colors.white,
//         child: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else {
//       return Center(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             CameraPreview(_cameraController),
//             Padding(
//               padding: const EdgeInsets.all(25),
//               child: FloatingActionButton(
//                 backgroundColor: MainColor.DarkPink,
//                 child: Icon(_isRecording ? Icons.stop : Icons.circle),
//                 onPressed: () => _recordVideo(),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
