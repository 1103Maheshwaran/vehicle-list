import 'package:flutter/material.dart';
import 'package:vehiclelist/add_vehicle.dart';
import 'package:vehiclelist/vehicle_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddVehicle()
          ));
        },
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
      body: SafeArea(child: ListView.builder(
        itemBuilder: (context, index) {
        return VehicleWidget();
      }, itemCount: 10,)),
    );
  }
}
