import 'package:catch_up/screens/login_register_page.dart';
import 'package:catch_up/screens/opening_screen.dart';
import 'package:catch_up/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; //firebase core dependency
import 'package:catch_up/Widgets/widgetTree.dart'; //Widget Tree file
import 'firebase_options.dart';
import 'screens/login_options.dart';

//initializing Firebase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      //home: const SplashScreen(),
      home: const LoginOptions(),
      //home: const SignUpPage(),
      //home: const SignIpPage(),
    );
  }
}
