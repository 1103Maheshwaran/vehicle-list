import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:vehiclelist/firestore.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreDatasource database = FirestoreDatasource();
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController mileageController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input Data'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter vehicle name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter vehicle age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: mileageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter mileage in km/liter',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> vehicleInfoMap = {
                      "Name": nameController.text,
                      "Age": ageController.text,
                      "Mileage": mileageController.text,
                      "id": randomAlphaNumeric(10)
                    };
                    await database
                        .addVehicleDetails(vehicleInfoMap, id)
                        .then((value) => Navigator.pop(context));
                  },
                  child: Text('Submit'),
                ),
              ],
            )
          ],
        ));
  }
}
