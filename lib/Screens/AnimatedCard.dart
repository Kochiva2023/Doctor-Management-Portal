import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AvailableDoctor.dart';

class DoctorCard extends StatefulWidget {
  const DoctorCard({super.key});

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool checkhoverstate = false;
  @override
  void initState() {
    super.initState();
    checkstate(false);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          checkstate(value);
        });
      },
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AvailableDoctorCard()));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: checkhoverstate
                ? Colors.green
                : Colors.deepPurpleAccent, //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          height: 250,
          width: 250,
          child: Column(
            children: [
              Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: AssetImage("images/doctor.png")),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Text(
                      "Admin Portal",
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void checkstate(bool value) {
    if (value) {
      setState(() {
        checkhoverstate = true;
      });
    } else {
      checkhoverstate = false;
    }
  }
}
