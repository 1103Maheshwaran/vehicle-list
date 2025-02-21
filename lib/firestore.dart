import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatasource {
  final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection('Vehicle');

  Future addVehicleDetails(
      Map<String, dynamic> vehicleInfoMap, String id) async {
    return await _collectionReference.doc(id).set(vehicleInfoMap);
  }

  Future<Stream<QuerySnapshot>> getVehicleDetails() async {
    return _collectionReference.snapshots();
  }

  Future deleteVehicleDetails(String id) async {
    return _collectionReference.doc(id).delete();
  }
}
