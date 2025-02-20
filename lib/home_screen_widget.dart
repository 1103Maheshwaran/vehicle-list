import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/add_vehicle.dart';
import 'package:vehiclelist/firestore.dart';
import 'package:vehiclelist/vehicle_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  Stream? vehicleStream;
  getOnLoad() async {
    vehicleStream = await FirestoreDatasource().getVehicleDetails();
    setState(() {});
    print("getOnLoad");
  }

  @override
  void initState() {
    getOnLoad();
    super.initState();
  }

  Widget allVehicleDetails() {
    return StreamBuilder(
        stream: vehicleStream,
        builder: (context, AsyncSnapshot snapShot) {
          return snapShot.hasData
              ? ListView.builder(
                  itemCount: snapShot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapShot.data.docs[index];
                    return VehicleWidget(documentSnapshot);
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddVehicle()));
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: SafeArea(
          child: Column(
              //itemBuilder: (context, index) {
              children: [
            Expanded(child: allVehicleDetails()),
          ]
              //}//,
              //itemCount: 3,
              )),
    );
  }
}
