import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vehiclelist/home_screen_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Vehicle List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreenWidget(),
    ),
  );
}
