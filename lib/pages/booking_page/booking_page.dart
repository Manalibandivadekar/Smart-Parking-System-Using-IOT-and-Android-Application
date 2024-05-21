import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_car_parking/controller/PakingController.dart';
import '../../config/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_car_parking/components/exit.dart';

class BookingPage extends StatefulWidget {
  final String slotName;
  final String slotId;

  const BookingPage({Key? key, required this.slotId, required this.slotName})
      : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _vehicleNumberController = TextEditingController();

  void showBookingConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Booking Confirmed"),
          content: const Text("Your slot is booked."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Navigate to the exit page
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const ThankYouPage()));
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Incorrect Vehicle Number"),
          content: const Text("Please enter a valid vehicle number."),
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

  // Function to update status and vehicle number in Firebase
  void updateSlotStatusAndVehicleNumber(
      String slotId, int status, String vehicleNumber) {
    DatabaseReference slotRef =
    FirebaseDatabase.instance.ref().child('CarSlots').child(slotId);
    slotRef.update({
      'status': status,
      'vehicleNumber': vehicleNumber,
    }).then((_) {
      print('Slot $slotId updated successfully');
    }).catchError((error) {
      print('Error updating slot $slotId: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "BOOK SLOT",
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/animation/running_car.json',
                        width: 300,
                        height: 200,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        "Book Now ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: blueColor,
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Enter your name ",
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: lightBg,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: blueColor,
                      ),
                      hintText: "ZYX Kumar",
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Text(
                        "Enter Vehicle Number ",
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _vehicleNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your vehicle number';
                      }
                      // Validate vehicle number format
                      if (!RegExp(
                          r'^[A-Z]{2}\s[0-9]{2}\s[A-Z]{2}\s[0-9]{4}$')
                          .hasMatch(value)) {
                        return 'Invalid vehicle number format';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      fillColor: lightBg,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.car_rental,
                        color: blueColor,
                      ),
                      hintText: "WB 04 ED 0987",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Slot Name",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            widget.slotName,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Validate the form
                          if (_formKey.currentState!.validate()) {
                            // If valid, update slot status and show booking confirmation dialog
                            updateSlotStatusAndVehicleNumber(
                                widget.slotId,
                                1,
                                _vehicleNumberController.text);
                            showBookingConfirmationDialog(context);
                          } else {
                            // If invalid, show error dialog
                            showErrorDialog(context);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                          decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "CONFIRM BOOKING",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}