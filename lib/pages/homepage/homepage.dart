//working 17/05 comment
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_car_parking/components/parking_slot.dart';
import 'package:smart_car_parking/controller/PakingController.dart';
import '../../config/colors.dart';
import 'package:smart_car_parking/components/exit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20),
            Text(
              "SMART PARKING",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Parking Slots",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("ENTRY"),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ParkingSlot(
                      slotName: "A-1",
                      slotId: "1",
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 80,
                    child: VerticalDivider(
                      color: blueColor,
                      // thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: ParkingSlot(
                      slotName: "A-2",
                      slotId: "2",
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ParkingSlot(
                      slotName: "A-3",
                      slotId: "3",
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 80,
                    child: VerticalDivider(
                      color: blueColor,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: ParkingSlot(
                      slotName: "A-4",
                      slotId: "4",
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              // Add more ParkingSlot widgets as needed
          const SizedBox(height: 20),
          // Add more ParkingSlot widgets as needed

          // Exit button
          ElevatedButton(
            onPressed: () {
              // Navigate to the exit page
              Get.to(ThankYouPage());
            },
            child: Text("Exit If all All Slots are Booked"),
          )
            ],
          ),
        ),
      ),
    );
  }
}
//latest
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:smart_car_parking/components/parking_slot.dart';
// import 'package:smart_car_parking/controller/PakingController.dart';
// import '../../components/speech_to_text_mixin.dart';
// import '../../config/colors.dart';
// import 'package:smart_car_parking/components/exit.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SpeechToTextMixin {
//   final _speech = stt.SpeechToText();
//
//   @override
//   Widget build(BuildContext context) {
//     ParkingController parkingController = Get.put(ParkingController());
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blueColor,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(width: 20),
//             Text(
//               "SMART PARKING",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.mic),
//             onPressed: () {
//               // Start or stop speech recognition when the microphone icon is tapped
//               if (isListening) {
//                 stopListening();
//               } else {
//                 requestPermissions().then((granted) {
//                   if (granted) {
//                     startListening();
//                   }
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "Parking Slots",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(height: 60),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text("ENTRY"),
//                       Icon(Icons.keyboard_arrow_down)
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-1",
//                       slotId: "1",
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 60,
//                     height: 80,
//                     child: VerticalDivider(
//                       color: blueColor,
//                       // thickness: 1,
//                     ),
//                   ),
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-2",
//                       slotId: "2",
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-3",
//                       slotId: "3",
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 60,
//                     height: 80,
//                     child: VerticalDivider(
//                       color: blueColor,
//                       thickness: 1,
//                     ),
//                   ),
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-4",
//                       slotId: "4",
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Add more ParkingSlot widgets as needed
//               const SizedBox(height: 20),
//               // Add more ParkingSlot widgets as needed
//
//               // Exit button
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to the exit page
//                   Get.to(ThankYouPage());
//                 },
//                 child: Text("Exit If all All Slots are Booked"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smart_car_parking/components/parking_slot.dart';
// import 'package:smart_car_parking/controller/PakingController.dart';
// import '../../components/speech_to_text_mixin.dart';
// import '../../config/colors.dart';
// import 'package:smart_car_parking/components/exit.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SpeechToTextMixin<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     ParkingController parkingController = Get.put(ParkingController());
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blueColor,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(width: 20),
//             Text(
//               "SMART PARKING",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.mic),
//             onPressed: () {
//               if (isListening) {
//                 stopListening();
//               } else {
//                 startListening();
//               }
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         "Parking Slots",
//                         style: TextStyle(
//                           fontSize: 20,
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(height: 60),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Text("ENTRY"),
//                       Icon(Icons.keyboard_arrow_down)
//                     ],
//                   ),
//                 ],
//               ),
//               const Row(
//                 children: [
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-1",
//                       slotId: "1",
//                     ),
//                   ),
//                   SizedBox(
//                     width: 60,
//                     height: 80,
//                     child: VerticalDivider(
//                       color: blueColor,
//                     ),
//                   ),
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-2",
//                       slotId: "2",
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 children: [
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-3",
//                       slotId: "3",
//                     ),
//                   ),
//                   SizedBox(
//                     width: 60,
//                     height: 80,
//                     child: VerticalDivider(
//                       color: blueColor,
//                       thickness: 1,
//                     ),
//                   ),
//                   Expanded(
//                     child: ParkingSlot(
//                       slotName: "A-4",
//                       slotId: "4",
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const SizedBox(height: 20),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Get.to(const ThankYouPage());
//                 },
//                 child: const Text("Exit If all All Slots are Booked"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
