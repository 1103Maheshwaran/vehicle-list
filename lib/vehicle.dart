import 'package:flutter/material.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({super.key});

  @override
  State<Vehicle> createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Lists'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
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
                Text("Name: ",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                SizedBox(height: 10),
                Text("Mileage: ",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                SizedBox(height: 10),
                Text("Age: ",
                    style: TextStyle(color: Colors.black, fontSize: 15))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
