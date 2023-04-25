import 'package:catch_up/screens/qrjoingrouppage.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
    MobileScannerController scannerController = MobileScannerController();
    bool _screenOpened = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Scanner"),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: scannerController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => scannerController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: scannerController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => scannerController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        //allowDuplicates: true,
        controller: scannerController,
        onDetect: _foundBarcode,
      ),
    );
  }

  void _foundBarcode(BarcodeCapture barcode) { //MobileScannerArguments? args
    /// open screen
    if (!_screenOpened) {
      final String groupId = barcode.rawValue ?? "---"; //gets group id from qr code
      debugPrint('Group Id found! $groupId');
      _screenOpened = true;

      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          QRJoinGroup(screenClosed: _screenWasClosed, groupId: groupId),)); //passes that group Id into qrjoingrouppage
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

