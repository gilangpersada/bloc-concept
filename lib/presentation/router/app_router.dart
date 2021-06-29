import 'package:bloc_concept/presentation/screens/home_screen.dart';
import 'package:bloc_concept/presentation/screens/second_screen.dart';
import 'package:bloc_concept/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueGrey,
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                  title: 'Second Screen',
                  color: Colors.yellow,
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.greenAccent,
                ));
        break;
      default:
        return null;
    }
  }
}
