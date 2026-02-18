import 'package:bookingapp/repository/screens/home/detail_screen.dart';
import 'package:bookingapp/repository/screens/home/home_screen.dart';
import 'package:bookingapp/repository/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = "/splashScreen";
  static const String homeScreen = "/homeScreen";
  static const String detailScreen = "/detailScreen";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splashScreen: (context) => SplashScreen(),
    homeScreen: (context) => HomeScreen(),
    detailScreen : (context) => DetailScreen()
  };
}
