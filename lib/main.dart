import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_car_parking/controller/splace_controller.dart';
import 'package:smart_car_parking/pages/splace_page/splace_screen.dart';
import 'config/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: 'AIzaSyB4Zd9pxcb_FGDb8czLW-UVSB6n0flPcTc',
      appId: '1:9694087846:android:0db5cbf76ee5663daec267',
      messagingSenderId: '9694087846',
      projectId: 'smart-parking-app-30420'));


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Parking',
      getPages: pages,
      theme: ThemeData(useMaterial3: true),
      home: const Splace_Screen(),
    );
  }
}
