import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AddDoctor.dart';
import 'package:flutter_application_1/Screens/DoctorCard.dart';
import 'package:flutter_application_1/authscreen/AuthScreen.dart';

class AvailableDoctorCard extends StatefulWidget {
  const AvailableDoctorCard({super.key});

  @override
  State<AvailableDoctorCard> createState() => _AvailableDoctorCardState();
}

class _AvailableDoctorCardState extends State<AvailableDoctorCard> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to Logout Admin Pannel'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ))
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  List doctorid = [];
  List imgurl = [];
  List doctorname = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddDoctor(),
                      ));
                    },
                  ),
                ),
              ],
              elevation: 10,
              backgroundColor: Colors.green,
              title: Text("Available Doctors")),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Container(
                  child: SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image(
                              width: 80, // Customize the width
                              height: 80, // Customize the height
                              fit: BoxFit.cover,
                              image: AssetImage('images/adminicon.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Welcome Admin",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      )),
                )),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AuthScreen(),
                    ));
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Logout Admin"),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CardGrid(
              doctorname: doctorname,
              doctorid: doctorid,
              doctorimg: imgurl,
            ),
          )),
    );
  }

  getData() async {
    DatabaseReference dbref = FirebaseDatabase.instance.ref();
    final snapshot = await dbref.child('doctordetail').get();
    if (snapshot.exists) {
      print("Data From database found");
      Iterable<DataSnapshot> values = snapshot.children;

      for (var x in values) {
        final snapshot1 =
            await dbref.child('doctordetail').child(x.key.toString()).get();
        if (snapshot1.exists) {
          Iterable<DataSnapshot> values = snapshot1.children;
          for (var v in values) {
            if (v.key == "name") {
              setState(() {
                doctorname.add(v.value);
              });
            }

            if (v.key == 'id') {
              setState(() {
                doctorid.add(v.value);
              });
            }

            if (v.key == 'imgurl') {
              imgurl.add(v.value);
            }
          }
        }
      }
    }
  }
}
