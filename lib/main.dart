import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/add_vehicle.dart';
import 'package:vehiclelist/home_screen_widget.dart';
import 'package:vehiclelist/vehicle_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Vehicle List',
      debugShowCheckedModeBanner: false,
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
