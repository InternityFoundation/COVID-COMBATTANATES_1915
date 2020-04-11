import 'package:flutter/material.dart';
import 'units.dart';
import 'users.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference unitsCollection = Firestore.instance.collection('bloodunits');
  Future updateUserData(String a,
  String a1,
  String aB,
  String aB1,
  String b,
  String b1,
  String o,
  String o1,)async{
    return await
        unitsCollection.document(uid).setData({
          'A+': a,
          'A-': a1,
          'AB+': aB,
          'AB-': aB1,
          'B+': b,
          'B-': b1,
          'O+': o,
          'O-': o1,
        });
  }

  List<Users>_userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Users(
        name: doc.data['name'] ?? '',
        address: doc.data['address'] ?? '',
        phone: doc.data['phone'] ?? '',
      );
    }).toList();
  }

  List<Units>_unitListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Units(
        a: doc.data['A+'] ?? '',
        a1: doc.data['A-'] ?? '',
        aB: doc.data['AB+'] ?? '',
        aB1: doc.data['AB-'] ?? '',
        b: doc.data['B+'] ?? '',
        b1: doc.data['B-'] ?? '',
        o: doc.data['O+'] ?? '',
        o1: doc.data['O-'] ?? '',
      );
    }).toList();
  }
  Stream<List<Users>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
  Stream<List<Units>> get bloodunits {
    return unitsCollection.snapshots().map(_unitListFromSnapshot);
  }
}

class BloodBank extends StatefulWidget {
  static String id = 'bloodbank';
  @override
  _BloodBankState createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;
  String a;
  String a1;
  String aB;
  String aB1;
  String b;
  String b1;
  String o;
  String o1;
  String uid;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        uid = user.uid;
        //print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  void getDocuments() async{
    await for(var snapshot in _firestore.collection('bloodunits').snapshots()) {
      for(var document in snapshot.documents){
        print(document.data);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorTheme,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Blood Units Data'),
      ),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "A+ Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      a=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "A- Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      a1=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "AB+ Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      aB=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "AB- Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      aB1=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "B+ Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      b=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "B- Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      b1=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "O+ Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      o=value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "O- Blood group Units:",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(29),
                            gapPadding: 3.3)),
                    onChanged: (value){
                      o1=value;
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
                        _firestore.collection('bloodunits').document(uid).updateData({
                          'A+': a,
                          'A-': a1,
                          'AB+': aB,
                          'AB-': aB1,
                          'B+': b,
                          'B-': b1,
                          'O+': o,
                          'O-': o1,
                        });
                     //   _auth.signOut();
                     //   Navigator.pop(context);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Submit Data',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
