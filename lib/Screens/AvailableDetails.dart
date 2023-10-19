import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screens/AvailableDoctor.dart';
import 'package:flutter_application_1/Screens/Dashboard.dart';

class AvailableDetails extends StatefulWidget {
  final String id;
  final String doctorimg;
  final String docname;
  const AvailableDetails(
      {super.key,
      required this.id,
      required this.doctorimg,
      required this.docname});

  @override
  State<AvailableDetails> createState() => _AvailableDetailsState();
}

class _AvailableDetailsState extends State<AvailableDetails> {
  TextEditingController name = new TextEditingController();
  TextEditingController specilisation = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  TextEditingController docid = new TextEditingController();

  bool editname = false;
  bool editspecilisation = false;
  bool editaddress = false;
  bool editnum1 = false;
  bool editnum2 = false;
  bool editdocid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.docname;
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to Delete Profile'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Profile Deleted"),
                  )),
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AvailableDoctorCard(),
                  ))
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<bool> _dataupdate() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to Update Profile'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Profile Updated"),
                  )),
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AvailableDoctorCard(),
                  ))
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Details"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  ClipOval(
                    child: Image(
                      width: 150, // Customize the width
                      height: 150, // Customize the height
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.doctorimg // Replace with your image URL
                          // You can use different BoxFit values to control the image's aspect ratio within the circular shape.
                          ),
                    ),
                  ),
                  Text(
                    widget.docname,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.person_2_outlined),
                                          labelText: "Doctor Name",
                                          border: InputBorder.none,
                                          hintText: "First Name"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.info_outline),
                                          labelText: "About Doctor",
                                          border: InputBorder.none,
                                          hintText: "Breif about Doctor"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.work_outline),
                                          labelText: "Specialization",
                                          border: InputBorder.none,
                                          hintText: "Specialization"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.location_city_outlined),
                                          labelText: "Clinic",
                                          border: InputBorder.none,
                                          hintText: "Clinic Address"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Card(
                              child: SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: TextField(
                                              enabled: editname,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons
                                                      .phone_android_outlined),
                                                  labelText: "Contact No",
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Enter Contact Number"),
                                              controller: name)),
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  editname = true;
                                                });
                                              },
                                              child: Icon(Icons.edit)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Card(
                              child: SizedBox(
                                height: 60,
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 9,
                                          child: TextField(
                                              enabled: editname,
                                              decoration: InputDecoration(
                                                  icon: Icon(Icons
                                                      .phone_android_outlined),
                                                  labelText:
                                                      "Alternative Contact Number",
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Enter Alternatve Contact NUmber"),
                                              controller: name)),
                                      Expanded(
                                          flex: 1,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  editname = true;
                                                });
                                              },
                                              child: Icon(Icons.edit)))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          color: Color.fromRGBO(255, 250, 207, 1),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        "Available Time Slots",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    )),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: CheckboxListTile(
                                            title: Text("8 AM -11 AM"),
                                            value: false,
                                            onChanged: (newValue) {
                                              setState(() {
                                                // checkedValue = newValue;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: CheckboxListTile(
                                            title: Text("11 AM - 2 PM"),
                                            value: false,
                                            onChanged: (newValue) {
                                              setState(() {
                                                // checkedValue = newValue;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: CheckboxListTile(
                                            title: Text("2 PM - 5 PM"),
                                            value: false,
                                            onChanged: (newValue) {
                                              setState(() {
                                                // checkedValue = newValue;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 5, 5),
                                        child: Container(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: CheckboxListTile(
                                            title: Text("5 PM - 8 PM"),
                                            value: false,
                                            onChanged: (newValue) {
                                              setState(() {
                                                // checkedValue = newValue;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.currency_rupee_outlined),
                                          labelText: "Consultant Fees",
                                          border: InputBorder.none,
                                          hintText: "Input in Rupees"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      child: SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: TextField(
                                      enabled: editname,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.note_add_outlined),
                                          labelText: "Note",
                                          border: InputBorder.none,
                                          hintText: "Any Other Note"),
                                      controller: name)),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          editname = true;
                                        });
                                      },
                                      child: Icon(Icons.edit)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: MaterialButton(
                              onPressed: () {
                                _dataupdate();
                              },
                              child: Card(
                                color: Colors.green,
                                child: SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ListTile(
                                      leading: Icon(
                                        Icons.update,
                                        color: Colors.white,
                                      ),
                                      title: Center(
                                          child: Text(
                                        "Update Details",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: MaterialButton(
                              onPressed: () {
                                _onWillPop();
                              },
                              child: Card(
                                color: Colors.red,
                                child: SizedBox(
                                  height: 50,
                                  width: double.infinity,
                                  child: ListTile(
                                      leading: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      title: Center(
                                          child: Text(
                                        "Delete Profile",
                                        style: TextStyle(color: Colors.white),
                                      ))),
                                ),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
