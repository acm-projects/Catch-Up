import 'package:camera/camera.dart';
import 'package:catch_up/screens/homepage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/videopage.dart';
import 'package:path_provider/path_provider.dart'; 
import 'package:video_player/video_player.dart';
import 'dart:io';
//import 'package:ffmpeg/ffmpeg.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';


/*
For merging videos:
- merge as each video uploads
- return the final video at release time


*/


//have a main url
//combine new url with the main url, set that merged output url as the main url

class FeatureButtonsView extends StatefulWidget {
  static String mainUrl = 'not real url';
  static String mainFilePath = 'empty'; //for ffmpeg
  final Function onUploadComplete;
  final String filePath;
  //final List<String> urls;

  FeatureButtonsView({
    Key? key,
    required this.onUploadComplete,
    required this.filePath,
    //required this.urls,
  }) : super(key: key); // requires the file path
  @override
  State<FeatureButtonsView> createState() => _FeatureButtonsViewState();
}

class _FeatureButtonsViewState extends State<FeatureButtonsView> {
  //final File file = File('Users/kanchanj/Desktop/ACM_Projects/Catch-Up/lib/screens/pathFile.txt');
  int videoCount = 0;
  //List<String> urls = [];
  List<File> _videos = [];
  late bool _isPlaying;
  late bool _isUploading;
  late bool _isRecorded;
  late bool _isRecording;
  late bool _downloadUrl;
  // String _filePath = widget.filePath;
  late VideoPlayerController _videoPlayerController;
  late CameraController _cameraController;
  @override
  void initState() {
    // initialize bools to false
    super.initState();
    _downloadUrl = false;
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
                  ElevatedButton.icon(
                    // upload video button (frontend)
                    //color:Colors.green,
                    icon: Icon(Icons.rectangle), //Icons.upload_file),
                    label: Text("Upload"),
                    onPressed: uploadFile,
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

  Future<void> uploadFile() async {
    _onFileUploadButtonPressed(File(widget.filePath));
   // uploadFiles(_videos);
  }


  //upload to specific group
  Future<String> _onFileUploadButtonPressed(File video) async {
    String videoUrl = "";
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    setState(() {
      _isUploading = true;
    });


    // Map<String, dynamic> video_urls = {
    //   'url1': ,
    //   };

    try {
      final storageReference = await firebaseStorage
          .ref('upload-video-firebase')
          .child(widget.filePath.substring(
              widget.filePath.lastIndexOf('/'), widget.filePath.length));
          UploadTask uploadTask = storageReference.putFile(File(widget.filePath));
          await uploadTask.whenComplete((){ });

          String url = await storageReference.getDownloadURL();

          checkMainFilePath(widget.filePath);

          //checkMainUrl(url);

          //print('\x1B[33m${widget.urls[0]}\x1B[0m');
          //return  await storageReference.getDownloadURL();
          return url;
         
    } catch (error) {
      // error, only execute if it does not upload
      print('Error occured while uplaoding to Firebase ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured while uplaoding'),
        ),
      );
      return "error";
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }


  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/pathFile.txt');
  // }




//   Future<List<String>> uploadFiles(List<File> _videos) async {
//    var videoUrls = await Future.wait(_videos.map((_video) => _onFileUploadButtonPressed(_video)));
   
//    //print(videoUrls);
//     String text = "WORKING";
//    print('\x1B[33m$text\x1B[0m');

//    return videoUrls;
//  }

void checkMainFilePath(String filePath) async {
  try {
  if (FeatureButtonsView.mainFilePath == 'empty') { //if main url is empty, set new url to it and don't merge anything
        String text = 'main file path was null';
        print('\x1B[33m$text\x1B[0m');

        FeatureButtonsView.mainFilePath = filePath; 
        print('\x1B[33m${FeatureButtonsView.mainFilePath}\x1B[0m');

        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('main file path was null'),
        ),
      );
      }
      else { //if there is a value in mainFilePath, merge that file path with the new file path
        String text = 'main file path has value';
        print('\x1B[33m$text\x1B[0m');
        _videoMerger(filePath); //call function to merge videos
    }

  } catch (error) {
      String text = 'Error occured with main file path';
     print('\x1B[33m$text\x1B[0m ${error.toString()}');
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured with main file path'),
        ),
      );
  }
}

// void checkMainUrl(String url) async {
//   try {
//   if (FeatureButtonsView.mainUrl == 'not real url') { //if main url is empty, set new url to it and don't merge anything
//         String text = 'main Url was null';
//         print('\x1B[33m$text\x1B[0m');

//         FeatureButtonsView.mainUrl = url;
//         ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('main Url was null'),
//         ),
//       );
//       }
//       else { //if there is a value in mainUrl, merge that url with the new url
//         String text = 'main Url has value';
//         print('\x1B[33m$text\x1B[0m');
//         _videoMerger(url); //call function to merge videos
//     }

//   } catch (error) {
//       String text = 'Error occured with mainUrl';
//      print('\x1B[33m$text\x1B[0m ${error.toString()}');
//      ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Error occured with main Url'),
//         ),
//       );
//   }
// }


 void _videoMerger(String filePath) async {  //String url

    //File? outputVideo;
  //ideoPlayerController? outputVidController;

    List<String> videoPaths = [
      FeatureButtonsView.mainFilePath,
      filePath,
    ];

    final appDir = await getApplicationDocumentsDirectory();
    String rawDocumentPath = appDir.path;
    final outputPath = '$rawDocumentPath/output1.mp4';

    //final ffmpeg = Fmpeg();
    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

    try {
        // String commandToExecute = '-i ${FeatureButtonsView.mainFilePath} -i ${filePath} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        // _flutterFFmpeg.execute(commandToExecute).then((rc) => print("FFmpeg process exited with rc $rc"));
        // print('\x1B[33m$outputPath\x1B[0m');\
    

        String commandToExecute = '-y -i ${FeatureButtonsView.mainFilePath} -i ${filePath} -r 24000/1001 -filter_complex \'[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[out]\' -map \'[out]\' $outputPath';
        // String commandToExecute = '-y -i ${FeatureButtonsView.mainFilePath} -i ${filePath} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        _flutterFFmpeg.execute(commandToExecute).then((rc) => print("FFmpeg process exited with rc $rc"));
        //
        //
        print('\x1B[33m${File(outputPath)}\x1B[0m');



         //_onFileUploadButtonPressed(File(outputPath));

          
        FirebaseStorage firebaseStorage = FirebaseStorage.instance;
         final storageReference = await firebaseStorage
          .ref('upload-video-firebase')
          .child(outputPath.substring(
              outputPath.lastIndexOf('/'), outputPath.length));
          UploadTask uploadTask = storageReference.putFile(File(outputPath));
          await uploadTask.whenComplete((){ });
        

        
    } catch (error) {
      print('Error occured with merging videos ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured with merging videos'),
        ),
      );
    }

    FeatureButtonsView.mainFilePath = outputPath; //set new merged video to main url

  }

}






  // void _onRecordAgainButtonPressed() {
  //   setState(() {
  //     _isRecorded = false;
  //   });
  // }
  // Future<void> _onRecordButtonPressed() async {
  //   if (_isRecording) {
  //     final file = await _cameraController
  //         .stopVideoRecording(); // stop the video recording
  //     _isRecording = false;
  //     _isRecorded = true;
  //   } else {
  //     _isRecorded = false;
  //     _isRecording = true;
  //     await _startRecording();
  //   }
  //   setState(() {});
  // }


 

