import 'package:camera/camera.dart';
import 'package:catch_up/screens/homepage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/screens/camerapage.dart';
import 'package:catch_up/screens/videopage.dart';
import 'package:path_provider/path_provider.dart'; 
import 'package:video_player/video_player.dart';
import 'dart:io';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
//import 'package:path_provider_ex/path_provider_ex.dart';


/*
For merging videos:
- merge as each video uploads
- return the final video at release time


*/


//have a main url
//combine new url with the main url, set that merged output url as the main url

class FeatureButtonsView extends StatefulWidget {
  static String mainUrl = 'not real url';
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

          checkMainUrl(url);


          // final file = await _localFile;

          // // Write the file
          // file.writeAsString('$url');

          //await urlsFile.writeAsString(url + '\n', mode: FileMode.append);

          //get path to text file
          // final Directory directory = await getApplicationDocumentsDirectory();
          // final File file = File('${directory.path}/urls.txt');
          // await file.writeAsString(url);

          ///Users/kanchanj/Desktop/ACM_Projects/Catch-Up/lib/screens/pathFile.txt
          // final file = await File('Users/kanchanj/Desktop/ACM_Projects/Catch-Up/lib/screens/pathFile.txt');

          // //Write the file
          // file.writeAsString('$url', mode: FileMode.append);

          //var file = await File('urls.txt').writeAsString('Hi');

          //list of urls uploaded to firebase
          //VideoPage.urls.add(url);
          //widget.onUploadComplete(url); //add a url to list everytime a vid is uploaded
          //videoCount++; 

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

void checkMainUrl(String url) async {
  try {
  if (FeatureButtonsView.mainUrl == 'not real url') { //if main url is empty, set new url to it and don't merge anything
        String text = 'main Url was null';
        print('\x1B[33m$text\x1B[0m');

        FeatureButtonsView.mainUrl = url;
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('main Url was null'),
        ),
      );
      }
      else { //if there is a value in mainUrl, merge that url with the new url
        String text = 'main Url has value';
        print('\x1B[33m$text\x1B[0m');
        _videoMerger(url); //call function to merge videos
    }

  } catch (error) {
      String text = 'Error occured with mainUrl';
     print('\x1B[33m$text\x1B[0m ${error.toString()}');
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occured with main Url'),
        ),
      );
  }
}


 void _videoMerger(String url) async {

    final appDir = await getApplicationDocumentsDirectory();
    String rawDocumentPath = appDir.path;
    final outputPath = '$rawDocumentPath/output.mp4';

    final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();

    try {
        String commandToExecute = '-i ${FeatureButtonsView.mainUrl} -i ${url} -filter_complex \'[0:0][1:0]concat=n=2:v=1:a=0[out]\' -map \'[out]\' $outputPath';
        _flutterFFmpeg.execute(commandToExecute).then((rc) => print("FFmpeg process exited with rc $rc"));
        print('\x1B[33m$outputPath\x1B[0m');


        // String outputFilePath = '/data/user/0/com.example.catch_up/app_flutter/output.mp4';
        // RegExp exp = RegExp(r'\/app_flutter\/(.*)');
        // Match match = exp.firstMatch(outputFilePath) as Match;
        // String? outputUrl = match.group(1);
        // print('\x1B[33m$outputUrl\x1B[0m'); // prints "output.mp4"

        
    } catch (error) {
      print('Error occured with merging videos ${error.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error occured with merging videos'),
        ),
      );
    }

    FeatureButtonsView.mainUrl = outputPath; //set new merged video to main url

  }

}

//Uploads Video File to Firebase
  // Future<void> _onFileUploadButtonPressed() async {
  //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //   setState(() {
  //     _isUploading = true;
  //   });
  //   try {
  //     //uploads file
  //     await firebaseStorage
  //         .ref('upload-video-firebase')
  //         .child(widget.filePath.substring(
  //             widget.filePath.lastIndexOf('/'), widget.filePath.length))
  //         .putFile(File(widget.filePath));
  //     widget.onUploadComplete();

  //   } catch (error) {
  //     // error, only execute if it does not upload
  //     print('Error occured while uplaoding to Firebase ${error.toString()}');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error occured while uplaoding'),
  //       ),
  //     );
  //   } finally {
  //     setState(() {
  //       _isUploading = false;
  //     });
  //   }
  // }




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
  // Future<void> _startRecording() async {
  //   if (_isRecorded) {
  //     // true ?
  //     Directory directory = await getApplicationDocumentsDirectory();
  //     String filepath = directory.path +
  //         '/' +
  //         DateTime.now().millisecondsSinceEpoch.toString() +
  //         '.mp4';
  //     _videoPlayerController =
  //         VideoPlayerController.file(File(widget.filePath));
  //     //FlutterAudioRecorder2(filepath, audioFormat: AudioFormat.AAC);
  //     await _videoPlayerController.initialize;
  //     _videoPlayerController.play();
  //     //_filePath = filepath;
  //     setState(() {});
  //   } else {
  //     content:
  //     Center(child: Text('The video was not able to be recorded'));
  //   }
  // }

