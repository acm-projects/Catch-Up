import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //firebase core dependency
import 'package:catch_up/Widgets/widgetTree.dart'; //Widget Tree file

/*import 'package:catch_up/screens/wrapper.dart';
import 'package:catch_up/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:catch_up/models/user.dart';
*/




//void main() {
 // runApp(MyApp());
//}


//initializing Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
  

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
      ),
      home: const WidgetTree(),
    );
  }
}


