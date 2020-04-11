import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'bloodbankregistration.dart';
import 'bloodbanklogin.dart';
import 'constants.dart';
import 'package:blood/bloodsearch.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcomescreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorTheme,
        title: Text('Blood Need'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 80.0),
                child: Icon(
                  Icons.healing,
                  size: 120.0,
                  color: kColorTheme,
                ),
              ),
              RoundedButton(
                title: 'Blood Bank Registration',
                onPressed: () {
                  Navigator.pushNamed(context, Registration.id);
                },
              ),
              RoundedButton(
                title: 'Blood Bank Login',
                onPressed: () {
                  Navigator.pushNamed(context, Login.id);
                },
              ),
              RoundedButton(
                title: 'Need for Blood',
                onPressed: () {
                  Navigator.pushNamed(context, BloodSearch.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
