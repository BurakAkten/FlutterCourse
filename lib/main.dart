import 'package:flutter/material.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Course Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 40),
        child: Column(
          children: [
            Text("People", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(height: 12),
            _people,
          ],
        ),
      ),
    );
  }

  AppBar get _appBar => AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.message,
              color: Colors.blue[50],
              size: 24,
            ),
          )
        ],
      );

  Widget get _people => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPerson(name: "John"),
            _buildPerson(name: "Paul"),
            _buildPerson(name: "Bill"),
            _buildPerson(name: "Will"),
            _buildPerson(name: "Smith"),
            _buildPerson(name: "Bill"),
            _buildPerson(name: "Will"),
            _buildPerson(name: "Smith"),
            _buildPerson(),
          ],
        ),
      );

  Widget _buildPerson({String? name}) => Row(
        children: [
          Icon(Icons.person, size: 32),
          SizedBox(width: 12),
          Text(
            name ?? "No Name Given",
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      );
}
