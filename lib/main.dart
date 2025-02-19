import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/vehicle.dart';

void main() async {
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Vehicle Listgit ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //primarySwatch: Colors.blue,
      ),
      home: const Vehicle(),
    ),
  );
}
