
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bloodbank.dart';
import 'package:provider/provider.dart';
import 'bloodbank_list.dart';
import 'units.dart';

class BankList extends StatelessWidget {
  static String id = 'BankList';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Units>>.value(
      value: DatabaseService().bloodunits,
        child: Scaffold(
            appBar: AppBar(
            backgroundColor: kColorTheme,
            title: Text('Blood Bank Data'),
        ),
      body: BloodBankList(),
        ),
    );
  }
}
