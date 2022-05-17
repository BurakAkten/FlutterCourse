import 'package:flutter/material.dart';
import 'package:flutter_course/utils/navigation_util.dart';
import 'my_home_page.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Course Home Page'),
      onGenerateRoute: NavigationUtil.onGenerateRoute,
      navigatorKey: NavigationUtil.navigatorKey,
    );
  }
}
