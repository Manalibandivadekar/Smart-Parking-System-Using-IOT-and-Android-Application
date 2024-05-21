// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:smart_car_parking/Data.dart';
//
// class Splace_Screen extends StatelessWidget {
//   const Splace_Screen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "VEHICLE PARKING",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Lottie.asset(
//                     'assets/animation/running_car.json',
//                     width: 200,
//                     height: 200,
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Book a slot for your vehicle from anywhere with your phone",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Text(
//               "Team Members:",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             _buildTeamMemberInfo("Manali M B", "4NI20CS048"),
//             _buildTeamMemberInfo("Medha", "4NI20CS051"),
//             _buildTeamMemberInfo("Nadiya Khan", "4NI20CS056"),
//             _buildTeamMemberInfo("Sanmitha L", "4NI20CS128"),
//             const SizedBox(height: 10),
//             const Text(
//               "Department of Computer Science and Engineering",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Text(
//               "National Institute of Engineering, Mysore",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTeamMemberInfo(String name, String usn) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           "$name, USN: $usn",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w200,
//           ),
//         ),
//         const SizedBox(height: 5),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class Splace_Screen extends StatelessWidget {
//   const Splace_Screen({super.key, Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20), // Add blank space
//             const Text(
//               "VEHICLE PARKING",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 20), // Add blank space
//             Lottie.asset(
//               'assets/animation/running_car.json',
//               width: 200,
//               height: 200,
//             ),
//             const SizedBox(height: 20), // Add blank space
//             const Text(
//               "Book a slot for your vehicle from anywhere with your phone",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 20), // Add blank space
//             const Text(
//               "Team Members:",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             _buildTeamMemberInfo("Manali M B", "4NI20CS048"),
//             _buildTeamMemberInfo("Medha", "4NI20CS051"),
//             _buildTeamMemberInfo("Nadiya Khan", "4NI20CS056"),
//             _buildTeamMemberInfo("Sanmitha L", "4NI20CS128"),
//             const SizedBox(height: 20), // Add blank space
//             const Text(
//               "Department of Computer Science and Engineering",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Text(
//               "National Institute of Engineering, Mysore",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTeamMemberInfo(String name, String usn) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           "$name, USN: $usn",
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w200,
//           ),
//         ),
//         const SizedBox(height: 5),
//       ],
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splace_Screen extends StatelessWidget {
  const Splace_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40), // Add blank space
            const Text(
              "VEHICLE PARKING",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20), // Add blank space
            Lottie.asset(
              'assets/animation/running_car.json',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20), // Add blank space
            const Text(
              "Book a slot for your vehicle from anywhere with your phone",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20), // Add blank space
            const Text(
              "Team Members:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            _buildTeamMemberInfo("Manali M B", "4NI20CS048"),
            _buildTeamMemberInfo("Medha", "4NI20CS051"),
            _buildTeamMemberInfo("Nadiya Khan", "4NI20CS056"),
            _buildTeamMemberInfo("Sanmitha L", "4NI20CS128"),
            const SizedBox(height: 20), // Add blank space
            const Text(
              "Department of Computer Science and Engineering",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/images/cselogo.png',
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 20),
            const Text(
              "National Institute of Engineering, Mysore",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberInfo(String name, String usn) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$name, USN: $usn",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

