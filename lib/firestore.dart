import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addVehicleDetails(
      Map<String, dynamic> vehicleInfoMap, String id) async {
    return await _firestore.collection('Vehicle').doc(id).set(vehicleInfoMap);
  }

  Future<Stream<QuerySnapshot>> getVehicleDetails() async {
    return _firestore.collection('Vehicle').snapshots();
  }
}
/*
Future<bool> AddVehicle(String vehicle, String mileage, int age) async{
  await _firestore.collection('vehicle').set({})
}
*/
