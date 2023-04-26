import 'package:catch_up/screens/home.dart';
import 'package:catch_up/screens/qrjoingrouppage.dart';
import 'package:flutter/material.dart';
//import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
//import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';


class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static late String groupId;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late Barcode result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   static const customSwatch = MaterialColor(
//     0xFFFF5252,
//     <int, Color>{
//       50: Color(0xFFFFEBEE),
//       100: Color(0xFFFFCDD2),
//       200: Color(0xFFEF9A9A),
//       300: Color(0xFFE57373),
//       400: Color(0xFFEF5350),
//       500: Color(0xFFFF5252),
//       600: Color(0xFFE53935),
//       700: Color(0xFFD32F2F),
//       800: Color(0xFFC62828),
//       900: Color(0xFFB71C1C),
//     },
//   );

//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: customSwatch,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   MobileScannerController cameraController = MobileScannerController();
//   bool _screenOpened = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mobile Scanner"),
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state as TorchState) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.cameraFacingState,
//               builder: (context, state, child) {
//                 switch (state as CameraFacing) {
//                   case CameraFacing.front:
//                     return const Icon(Icons.camera_front);
//                   case CameraFacing.back:
//                     return const Icon(Icons.camera_rear);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: MobileScanner(
//         //allowDuplicates: true,
//         controller: cameraController,
//         onDetect: _foundBarcode,
//       ),
//     );
//   }

//   void _foundBarcode(BarcodeCapture barcode) {
//     MobileScannerArguments? args;
//     /// open screen
//     if (!_screenOpened) {
//       final String code = barcode.rawValue ?? "---";
//       debugPrint('Barcode found! $code');
//       _screenOpened = true;
//       Navigator.push(context, MaterialPageRoute(builder: (context) =>
//           FoundCodeScreen(screenClosed: _screenWasClosed, value: code),));
//     }
//   }

//   void _screenWasClosed() {
//     _screenOpened = false;
//   }
// }

// class FoundCodeScreen extends StatefulWidget {
//   final String value;
//   final Function() screenClosed;
//   const FoundCodeScreen({
//     Key? key,
//     required this.value,
//     required this.screenClosed,
//   }) : super(key: key);

//   @override
//   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// }

// class _FoundCodeScreenState extends State<FoundCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Found Code"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             widget.screenClosed();
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_outlined,),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Scanned Code:", style: TextStyle(fontSize: 20,),),
//               SizedBox(height: 20,),
//               Text(widget.value, style: TextStyle(fontSize: 16,),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class Scanner extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Scanner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ScannerPage(title: 'QR Scanner'),
//     );
//   }
// }

// class ScannerPage extends StatefulWidget {
//   ScannerPage({Key? key, required this.title}) : super(key: key);


//   final String title;
//   static late String id;


//   @override
//   _ScannerPageState createState() => _ScannerPageState();
// }



  

  

// class _ScannerPageState extends State<ScannerPage> {
//   late String _barcode;
//   late bool visible;

//    late MobileScannerController _controller;

//   @override
  // void initState() {
  //   super.initState();
  //   _controller = MobileScannerController(
  //     facing: CameraFacing.back,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Mobile Scanner')),
  //     body: MobileScanner(
  //       // fit: BoxFit.contain,
  //       controller: MobileScannerController(
  //         detectionSpeed: DetectionSpeed.normal,
  //         facing: CameraFacing.front,
  //         torchEnabled: true,
  //       ),
  //       onDetect: (capture) {
  //         final List<Barcode> barcodes = capture.barcodes;
  //         //final Uint8List? image = capture.image;
  //         for (final barcode in barcodes) {
  //           debugPrint('Barcode found! ${barcode.rawValue}');
  //         }
  //       },
  //     ),
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.flip_camera_ios),
//             onPressed: () => _controller.switchCamera(),
//           ),
//           IconButton(
//             icon: ValueListenableBuilder(
//               valueListenable: _controller.torchState,
//               builder: (context, value, child) {
//                 switch (value) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on);
//                 }
//               },
//             ),
//             onPressed: () => _controller.toggleTorch(),
//           ),
//         ],
//         elevation: 0,
        
//       ),
//       extendBodyBehindAppBar: true,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (_) => const QRView()),
//         ),
//         elevation: 0,
//         child: const Icon(Icons.qr_code_2),
//       ),
//       body: MobileScanner(
//         controller: _controller,
//         onDetect: (barcode) => _showScanDialog(barcode.rawValue),
//       ),
//     );
//   }
// }
