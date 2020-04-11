import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'bloodbanklogin.dart';
import 'bloodbankregistration.dart';
import 'bloodbank.dart';
import 'bloodsearch.dart';
import 'banklist.dart';


void main() => runApp(Blood());

class Blood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Registration.id: (context) => Registration(),
        Login.id: (context) => Login(),
        BloodSearch.id: (context) => BloodSearch(),
        BloodBank.id: (context) => BloodBank(),
        BankList.id: (context) => BankList(),
      },
    );
  }
}
