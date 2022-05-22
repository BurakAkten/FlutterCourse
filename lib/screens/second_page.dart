import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(
        child: Container(
          height: 50,
          width: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
