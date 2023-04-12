//New Login Page
import 'package:catch_up/screens/createGroupPage.dart';
import 'package:catch_up/services/auth.dart'; //auth services class
import 'package:cloud_firestore/cloud_firestore.dart'; //firestore
import 'package:flutter/material.dart'; 
import 'package:firebase_auth/firebase_auth.dart'; //auth package


class LoginPage extends StatefulWidget {
  static late String uid;
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? errorMessage = '';
  bool isLogin = true;

  //Text Editing for Email and Password
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();


   //Get Uid for Login
  Future<void> getUid() async {

  //find user doc that matches entered email
   await _firestore.collection('users').where("email", isEqualTo: _controllerEmail.text).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          LoginPage.uid = docSnapshot.id; //set the doc Id equal to the user Id
        }
      }
    );

  }

  //Sign In
  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthService().signInWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text,
      );

      getUid();

    } on FirebaseAuthException catch (e) {
      setState(() { 
        errorMessage = e.message;
      });
    }
  }
  
  Future<void> createUserWithEmailAndPassword() async {
    try {
      //create User for Auth
      await AuthService().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      
      //Data to save in a user's document
      Map<String, dynamic> userDataToSave = {
      'email': _controllerEmail.text,
      };
       
       //Add user data to user document in user collection
       DocumentReference _docRef = await _firestore.collection('users').add(userDataToSave);
       LoginPage.uid = _docRef.id;

    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth'); 
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
        isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _createGroupButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return CreateGroup();
                          },
                        ),
                      );

      },
      child: Text('Create Group'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            _createGroupButton(),
          ], 
        ),
      ),
    );
  }
}
