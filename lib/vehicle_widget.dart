import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VehicleWidget extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const VehicleWidget(this.documentSnapshot, {super.key});

  @override
  State<VehicleWidget> createState() => _VehicleState();
}

class _VehicleState extends State<VehicleWidget> {
  @override
  Widget build(BuildContext context) {
    print("Name:  + $widget.documentSnapshot['Name']");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 7.0,
                spreadRadius: 5.0,
                blurStyle: BlurStyle.normal),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Name:   ${widget.documentSnapshot['Name']}",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              SizedBox(height: 10),
              Text("Mileage: ${widget.documentSnapshot['Mileage']}",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              SizedBox(height: 10),
              Text("Age: ${widget.documentSnapshot['Age']}",
                  style: TextStyle(color: Colors.black, fontSize: 15))
            ],
          ),
        ),
      ),
    );
  }
}
