import 'package:catch_up/screens/home.dart';
import 'package:catch_up/screens/qrjoingrouppage.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_barcode_listener/flutter_barcode_listener.dart';


class Scanner extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScannerPage(title: 'QR Scanner'),
    );
  }
}

class ScannerPage extends StatefulWidget {
  ScannerPage({Key? key, required this.title}) : super(key: key);

  final String title;
  static late String id;

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late String _barcode;
  late bool visible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Add visiblity detector to handle barcode
        // values only when widget is visible
        child: VisibilityDetector(
          onVisibilityChanged: (VisibilityInfo info) {
            visible = info.visibleFraction > 0;
          },
          key: Key('visible-detector-key'),
          child: BarcodeKeyboardListener(
            bufferDuration: Duration(milliseconds: 200),
            onBarcodeScanned: (barcode) {
              if (!visible) return;
              print(barcode);
              setState(() {
                _barcode = barcode;
                ScannerPage.id = barcode;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _barcode == null ? 'SCAN BARCODE' : 'BARCODE: ${ScannerPage.id}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  QRJoinGroup())),
                      child: Center(child: Text('Second screen'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}