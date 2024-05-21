import 'package:another_dashed_container/another_dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_car_parking/pages/booking_page/booking_page.dart';
import 'package:smart_car_parking/config/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_car_parking/components/CancelBooking.dart';

class ParkingSlot extends StatefulWidget {
  final String slotId;
  final String slotName;

  const ParkingSlot({
    Key? key,
    required this.slotId,
    required this.slotName,
  }) : super(key: key);

  @override
  _ParkingSlotState createState() => _ParkingSlotState();
}

class _ParkingSlotState extends State<ParkingSlot> {
  bool? _isBooked;
  String vehicleNumber="";

  @override
  void initState() {
    super.initState();
    // Fetch status from Firebase when the widget is initialized
    fetchSlotStatus();
  }

  void fetchSlotStatus() {
    // Fetch status of the parking slot from Firebase
    FirebaseDatabase.instance
        .ref()
        .child('CarSlots')
        .child(widget.slotId)
        .onValue
        .listen((event) {
      if (event.snapshot.exists) {
        Map<dynamic, dynamic>? slotData =
        event.snapshot.value as Map<dynamic, dynamic>?; // Adjusted type
        if (slotData != null) {
          int? status =
          slotData['status'] as int?; // Adjusted type
          vehicleNumber =
          slotData['vehicleNumber'] as String; // Adjusted type
          if (status == 1) {
            _isBooked = true;
          } else {
            _isBooked = false;
          }
          setState(() {}); // Update the UI after fetching data
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = _isBooked == true ? Colors.red : blueColor;
    String buttonText = _isBooked == true
        ? vehicleNumber
        : "BOOK"; // Changed to non-nullable type
    return DashedContainer(
      dashColor: Colors.blue.shade300,
      dashedLength: 10.0,
      blankLength: 9.0,
      strokeWidth: 1.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 180,
        height: 160, // Increased height to accommodate the cancel button
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: bgColor, // Adjusted color based on _isBooked value
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.slotName,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_isBooked == true)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 30),
                      decoration: BoxDecoration(
                        color: bgColor, // Adjusted color based on _isBooked value
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to cancel booking page
                        Get.to(CancelBooking(slotId: widget.slotId));
                      },
                      child: const Text(
                        "Cancel Booking",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              )

            else
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Get.to(BookingPage(
                        slotId: widget.slotId,
                        slotName: widget.slotName,
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 30),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
// latest
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:another_dashed_container/another_dashed_container.dart';
// import 'package:smart_car_parking/components/speech_to_text_mixin.dart';
// import 'package:smart_car_parking/pages/booking_page/booking_page.dart';
// import 'package:smart_car_parking/config/colors.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:smart_car_parking/components/CancelBooking.dart';
// import 'package:smart_car_parking/components/exit.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// class ParkingSlot extends StatefulWidget {
//   final String slotId;
//   final String slotName;
//
//   const ParkingSlot({
//     Key? key,
//     required this.slotId,
//     required this.slotName,
//   }) : super(key: key);
//
//   @override
//   _ParkingSlotState createState() => _ParkingSlotState();
// }
//
// class _ParkingSlotState extends State<ParkingSlot> with SpeechToTextMixin {
//   final _speech = stt.SpeechToText();
//
//   @override
//   Widget build(BuildContext context) {
//     return DashedContainer(
//       dashColor: Colors.blue.shade300,
//       dashedLength: 10.0,
//       blankLength: 9.0,
//       strokeWidth: 1.0,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         width: 180,
//         height: 160, // Increased height to accommodate the cancel button
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding:
//                   const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: bgColor, // Adjusted color based on _isBooked value
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     widget.slotName,
//                     style: const TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             if (_isBooked == true)
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 7, horizontal: 30),
//                       decoration: BoxDecoration(
//                         color: bgColor, // Adjusted color based on _isBooked value
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text(
//                         buttonText,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1.0,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Navigate to cancel booking page
//                         Get.to(CancelBooking(slotId: widget.slotId));
//                       },
//                       child: Text(
//                         "Cancel Booking",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//
//             else
//               Expanded(
//                 child: Center(
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(BookingPage(
//                         slotId: widget.slotId,
//                         slotName: widget.slotName,
//                       ));
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 7, horizontal: 30),
//                       decoration: BoxDecoration(
//                         color: bgColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text(
//                         buttonText,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
