import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/add_vehicle.dart';
import 'package:vehiclelist/home_screen_widget.dart';
import 'package:vehiclelist/vehicle_widget.dart';

void main() async {
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Vehicle List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //primarySwatch: Colors.blue,
      ),
      //home: const HomeScreenWidget(),
      home: const HomeScreenWidget(),
    ),
  );
}
