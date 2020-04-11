import 'package:flutter/material.dart';
import 'units.dart';
import 'package:provider/provider.dart';
import 'reusable_card.dart';
class BloodBankList extends StatefulWidget {
  @override
  _BloodBankListState createState() => _BloodBankListState();
}

class _BloodBankListState extends State<BloodBankList> {

  @override
  Widget build(BuildContext context) {
    final bloodunits = Provider.of<List<Units>>(context);

    return ListView.builder(
      itemCount: bloodunits.length,
      itemBuilder: (context, index){
        return ReusableCard(unit: bloodunits[index],);
      },
    );
  }
}
