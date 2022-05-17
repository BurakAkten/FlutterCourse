import 'package:flutter/material.dart';
import 'package:flutter_course/second_page.dart';
import 'package:flutter_course/third_page.dart';
import 'package:flutter_course/utils/navigation_util.dart';

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
            _buildPeople(context),
            SizedBox(height: 20),
            _buildClickButton(context)
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
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

  Widget _buildPeople(BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPerson(context, name: "John"),
            _buildPerson(context, name: "Paul"),
            _buildPerson(context, name: "Bill"),
            _buildPerson(context, name: "Will"),
            _buildPerson(context, name: "Smith"),
            _buildPerson(context, name: "Bill"),
            _buildPerson(context, name: "Will"),
            _buildPerson(context, name: "Smith"),
            _buildPerson(context),
          ],
        ),
      );

  Widget _buildPerson(BuildContext context, {String? name}) => InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ThirdPage(
          //       person: PersonInfo(
          //         name ?? "No Name Given",
          //         23,
          //       ),
          //     ),
          //   ),
          // );

          //advanced
          NavigationUtil.navigateToThirdScreen(context, arguments: PersonInfo(name ?? "No Name Given", 23));
        },
        child: Row(
          children: [
            Icon(Icons.person, size: 32),
            SizedBox(width: 12),
            Text(
              name ?? "No Name Given",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      );

  Widget _buildClickButton(BuildContext context) => InkWell(
        onTap: () {
          //basic
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SecondPage()),
          // );

          //Advanced
          NavigationUtil.navigateToSecondScreen(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12,
                  offset: Offset(4, 8),
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Click Me", style: TextStyle(color: Colors.white)),
              Icon(
                Icons.forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      );
}
