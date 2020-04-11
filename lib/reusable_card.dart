import 'package:flutter/material.dart';
import 'units.dart';
import 'package:blood/constants.dart';

class ReusableCard extends StatelessWidget {
  final Units unit;
  ReusableCard({
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
        margin: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(4.0),
              color: kColorTheme,
              child: Text(
                'Blood Bank',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('Address: Tilak Nagar'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('Phone: 9876543210'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('A+ : ${unit.a}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('A- : ${unit.a1}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('AB+ : ${unit.aB}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('AB- : ${unit.aB1}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('B+ : ${unit.b}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('B- : ${unit.b1}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('O+ : ${unit.o}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
              child: Text('O- : ${unit.o1}'),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: kColorTheme,
          ),
        ),
      ),
    );
  }
}
