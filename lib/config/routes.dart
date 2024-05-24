import 'package:get/get.dart';
import 'package:smart_car_parking/pages/MapPage.dart';

import 'package:smart_car_parking/pages/homepage/homepage.dart';

var pages = [
  GetPage(
    name: '/homepage',
    page: () => const HomePage(),
    transition: Transition.rightToLeft,
  ),
 
];
