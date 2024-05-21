import 'package:get/get.dart';
import 'package:smart_car_parking/pages/MapPage.dart';

import 'package:smart_car_parking/pages/homepage/homepage.dart';

var pages = [
  GetPage(
    name: '/homepage',
    page: () => const HomePage(),
    transition: Transition.rightToLeft,
  ),
  // GetPage(
  //   name: '/about-us',
  //   page: () => const AboutUs(),
  //   transition: Transition.rightToLeft,
  // ),
  GetPage(
    name: '/map-page',
    page: () => const MapPage(),
    transition: Transition.fade,
  ),
];
