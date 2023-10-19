import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AvailableDetails.dart';

class CardGrid extends StatefulWidget {
  final List doctorid;
  final List doctorimg;
  final List doctorname;

  const CardGrid(
      {super.key,
      required this.doctorname,
      required this.doctorid,
      required this.doctorimg});

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  bool checkstat = false;
  List imglist = [
    "images/im01.jpg",
    "images/im01.jpg",
    "images/im01.jpg",
    "images/im01.jpg"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.doctorname.length != 0
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  widget.doctorname.length, // Number of columns in the grid
              crossAxisSpacing: 16.0, // Spacing between columns
              mainAxisSpacing: 16.0, // Spacing between rows
            ),
            itemCount: 4, // Number of cards in the grid
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 4, // Card elevation
                margin: EdgeInsets.all(8.0), // Margin around each card
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image(
                            width: 150, // Customize the width
                            height: 135, // Customize the height
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.doctorimg[
                                  index], // Replace with your image URL
                              // You can use different BoxFit values to control the image's aspect ratio within the circular shape.
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 5, 20),
                          child: Text(
                            widget.doctorname[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AvailableDetails(
                                        id: widget.doctorid[index].toString(),
                                        doctorimg:
                                            widget.doctorimg[index].toString(),
                                        docname:
                                            widget.doctorname[index].toString(),
                                      )));
                            },
                            child: SizedBox(
                                height: 40,
                                width: double.infinity,
                                child: Card(
                                    color: Colors.green,
                                    child: Center(
                                        child: Text(
                                      "Explore More",
                                      style: TextStyle(color: Colors.white),
                                    )))),
                          ),
                        )
                      ],
                    )),
              );
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
