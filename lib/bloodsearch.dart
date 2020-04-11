import 'package:blood/banklist.dart';
import 'package:flutter/material.dart';
import 'package:blood/constants.dart';


class BloodSearch extends StatefulWidget {
  static String id = 'BloodSearch';
  @override
  _BloodSearchState createState() => _BloodSearchState();
}
class _BloodSearchState extends State<BloodSearch> {
  String bloodGroup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorTheme,
        title: Text('Blood Unit Search'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Enter Required Blood Group",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onChanged: (value){
                bloodGroup=value;
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
                onPressed: () {
                  Navigator.pushNamed(context, BankList.id);
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
