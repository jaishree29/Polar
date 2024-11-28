import 'package:flutter/material.dart';
import 'package:netflix_clone/views/details_screen.dart';
import 'package:netflix_clone/views/home/home_screen.dart';
import 'package:netflix_clone/views/search_screen.dart';
import 'package:netflix_clone/views/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String search = '/search';
  static const String details = '/details';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => HomeScreen(),
    search: (context) => SearchScreen(),
    details: (context) => DetailsScreen(),
  };
}
