import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bloodbank.dart';
class Registration extends StatefulWidget {
  static String id = 'bloodbankregistration';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  bool showSpinner = false;
  String name;
  String email;
  String phone;
  String address;
  String password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
//      backgroundColor: Colors.red[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Blood Bank Registration'),
        ),
        body: Center(
          child: Form(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Blood Bank Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value){
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            gapPadding: 3.3)),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    maxLengthEnforced: true,
                    onChanged: (value){
                      phone = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Enter email id",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29),
                        )),
                    onChanged: (value){
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value){
                      address = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value){
                      password = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          AuthResult result = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                          FirebaseUser user = result.user;
                          if (result != null) {
                            Navigator.pushNamed(context, WelcomeScreen.id);
                          }
                          await DatabaseService(uid: user.uid).updateUserData('0',
                              '0',
                              '0',
                              '0',
                              '0',
                              '0',
                              '0',
                              '0');
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                        _firestore.collection('users').add({
                          'name': name,
                          'email': email,
                          'address': address,
                          'phone': phone,
                          'password': password,
                        });
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
