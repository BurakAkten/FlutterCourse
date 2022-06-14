import 'package:flutter/material.dart';
import 'package:flutter_course/screens/hw1/hw1_home_screen.dart';
import 'package:flutter_course/utils/navigation_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.blue),
        // appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      home: Hw1HomeScreen(),
      onGenerateRoute: NavigationUtil.onGenerateRoute,
      navigatorKey: NavigationUtil.navigatorKey,
    );
  }
}
