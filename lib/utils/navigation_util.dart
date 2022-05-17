import 'package:flutter/material.dart';
import 'package:flutter_course/my_home_page.dart';
import 'package:flutter_course/second_page.dart';
import 'package:flutter_course/third_page.dart';

class NavigationUtil {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String homeScreen = "homeScreen";
  static const String secondScreen = "secondScreen";
  static const String thirdScreen = "thirdScreen";
  static const String profileScreen = "profileScreen";

  static navigateToBack(context, {dynamic value}) => Navigator.pop(context, value);

  static _navigateToPageAndRemoveUntil(context, String pageName, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(context, pageName, (Route<dynamic> route) => false, arguments: arguments);

  static _navigateToPage(context, String pageName, {Object? arguments}) => Navigator.pushNamed(context, pageName, arguments: arguments);

  //Navigate screens methods
  static navigateToSecondScreen(context, {Object? arguments}) => _navigateToPage(context, secondScreen, arguments: arguments);
  static navigateToThirdScreen(context, {Object? arguments}) => _navigateToPage(context, thirdScreen, arguments: arguments);
  static navigateToProfileScreen(context, {Object? arguments}) => _navigateToPageAndRemoveUntil(context, profileScreen, arguments: arguments);

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
      case profileScreen:
        page = MyHomePage(title: "");
        break;
    }
    return page;
  }
}
