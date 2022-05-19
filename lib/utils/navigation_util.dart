import 'package:flutter/material.dart';
import 'package:flutter_course/my_home_page.dart';
import 'package:flutter_course/second_page.dart';
import 'package:flutter_course/third_page.dart';

import '../rand_animal.dart';

class NavigationUtil {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String homeScreen = "homeScreen";
  static const String secondScreen = "secondScreen";
  static const String thirdScreen = "thirdScreen";
  static const String randAnimalScreen = "randAnimalScreen";

  static navigateToBack(context, {dynamic value}) => Navigator.pop(context, value);

  static _navigateToPageAndRemoveUntil(context, String pageName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(context, pageName, (Route<dynamic> route) => false, arguments: arguments);

  static _navigateToPage(context, String pageName, {Object? arguments}) => Navigator.pushNamed(context, pageName, arguments: arguments);

  //Navigate screens methods
  static navigateToSecondScreen(context, {Object? arguments}) => _navigateToPage(context, secondScreen, arguments: arguments);
  static navigateToThirdScreen(context, {Object? arguments}) => _navigateToPage(context, thirdScreen, arguments: arguments);
  static navigateToRandAnimalScreen(context, {Object? arguments}) => _navigateToPage(context, randAnimalScreen, arguments: arguments);

  static Route onGenerateRoute(settings) => MaterialPageRoute(builder: (context) => _buildNavigationMap(context, settings));

  static _buildNavigationMap(context, settings) {
    Widget page = MyHomePage(title: "My Home Page");
    switch (settings.name) {
      case secondScreen:
        page = SecondPage();
        break;
      case thirdScreen:
        page = ThirdPage(person: settings.arguments);
        break;
      case randAnimalScreen:
        page = RandScreen();
        break;
    }
    return page;
  }
}
