import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../config/colors.dart';
import 'package:smart_car_parking/components/exit.dart';

class CancelBooking extends StatefulWidget {
  final String slotId;

  const CancelBooking({Key? key, required this.slotId}) : super(key: key);

  @override
  _CancelBookingState createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  final TextEditingController _slotNameController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  Future<void> cancelBooking() async {
    String slotName = _slotNameController.text.trim();
    String vehicleNumber = _vehicleNumberController.text.trim();

    // Check if the entered vehicle number exists in the database
    DataSnapshot? snapshot;
    try {
      snapshot = (await FirebaseDatabase.instance
          .ref()
          .child('CarSlots')
          .child(widget.slotId)
          .child('vehicleNumber')
          .once()).snapshot;
    } catch (error) {
      print('Error retrieving snapshot: $error');
    }

    if (snapshot != null && snapshot.exists) {
      String? dbVehicleNumber = snapshot.value as String?;
      if (dbVehicleNumber == vehicleNumber) {
        // Update slot status and vehicle number in Firebase
        DatabaseReference slotRef = FirebaseDatabase.instance.ref().child('CarSlots').child(widget.slotId);
        slotRef.update({
          'status': 0,
          'vehicleNumber': '',
        }).then((_) {
          print('Booking cancelled for slot ${widget.slotId}');
          // Navigate to the exit page
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouPage(),
          ));
        }).catchError((error) {
          print('Error cancelling booking for slot ${widget.slotId}: $error');
        });
      } else {
        // Show an error message if the entered vehicle number doesn't match
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Entered vehicle number does not match."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      // Show an error message if snapshot doesn't exist
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Snapshot doesn't exist."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "Cancel Booking",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _slotNameController,
              decoration: const InputDecoration(
                labelText: "Slot Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _vehicleNumberController,
              decoration: const InputDecoration(
                labelText: "Vehicle Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform cancellation
                cancelBooking();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Cancel Booking"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _slotNameController.dispose();
    _vehicleNumberController.dispose();
    super.dispose();
  }
}
