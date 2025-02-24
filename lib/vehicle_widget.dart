import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/firestore.dart';

class VehicleWidget extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const VehicleWidget(this.documentSnapshot, {super.key});

  Color colourCode(String age, String mileage) {
    double? parsedMileage = double.tryParse(mileage);
    double? parsedAge = double.tryParse(age);

    // Handle cases where parsing fails (e.g., non-numeric data)
    if (parsedMileage == null || parsedAge == null) {
      return Colors.red; // Or some other default color
    }
    if (parsedMileage >= 15 && parsedAge <= 5) {
      return Colors.green;
    } else if (int.parse(mileage) >= 15 && int.parse(age) > 5) {
      return Colors.amber;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final name = documentSnapshot['Name'] ?? '';
    final age = documentSnapshot['Age'] ?? '';
    final mileage = documentSnapshot['Mileage'] ?? '';
    final id = documentSnapshot.id;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colourCode("$age", "$mileage"),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name: $name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                      onTap: () async {
                        await FirestoreDatasource().deleteVehicleDetails(id);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Text("Mileage: $mileage",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Age: $age",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
