import 'package:catch_up/screens/createGroupPage.dart';
import 'package:flutter/material.dart';
import 'package:catch_up/services/qr_image.dart';
import 'package:qr_flutter/qr_flutter.dart';

//after you scan qr code, it will show group name and a join button
//so instead of typing group name and getting page with group name and join button,
//the code will take you to that page
//instead of entering group name, you scan it 
//so if you click "go" to take you to the group's join page, scan replaces the go button


//don't need this page in final app, this just asks user to enter url and user clicks button that goes to a qr code with that utl

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + QR code'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter your URL'),
            ),
          ),
          //This button when pressed navigates to QR code generation
          ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(CreateGroup.groupId); //This should go on the groups page
                    }),
                  ),
                );
              },
              child: const Text('GENERATE QR CODE')),
        ],
      ),
    );
  }
}