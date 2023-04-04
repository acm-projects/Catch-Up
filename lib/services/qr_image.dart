import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QRImage extends StatefulWidget {
  const QRImage(TextEditingController controller, {super.key});

  final TextEditingController controller = TextEditingController();

  @override
  State<QRImage> createState() => _QRImageState();
}

class _QRImageState extends State<QRImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter + QR code'),
          centerTitle: true,
        ),
        body: Center(
          child: QrImage(
            data: widget.controller.text,
            size: 280,
            // You can include embeddedImageStyle Property if you 
            //wanna embed an image from your Asset folder
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(
                100,
                100,
              ),
            ),
          ),
        ),
     );
   }
}
