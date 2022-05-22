import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero")),
      body: Center(
        child: Container(
          child: Hero(
            tag: "profile",
            child: Image.asset(
              "assets/user-profile.png",
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
