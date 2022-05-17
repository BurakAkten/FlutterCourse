import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  final PersonInfo person;

  const ThirdPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Page")),
      body: Center(
        child: Container(
          height: 160,
          width: 160,
          color: Colors.green,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  person.personName,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  "${person.age}",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonInfo {
  final String personName;
  final int age;

  PersonInfo(this.personName, this.age);
}
