import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: "Home", color: Colors.blueAccent));
      case '/second':
        return MaterialPageRoute(
            builder: (_) =>
                const SecondScreen(title: "Second", color: Colors.redAccent));
      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                const ThirdScreen(title: "Third", color: Colors.greenAccent));
      default:
        return null;
    }
  }
}
