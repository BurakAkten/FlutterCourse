import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/base/services/base_service.dart';

import 'models/animal_model.dart';

class RandScreen extends StatefulWidget {
  @override
  State<RandScreen> createState() => _RandScreenState();
}

class _RandScreenState extends State<RandScreen> {
  Future<Animal?>? _getAnimal() async {
    ServiceResponseModel serviceModel = await BaseService().getRequest(BaseService.randomEndPoint);
    if (serviceModel.isSuccess) {
      Animal animal = Animal.fromJson(jsonDecode(serviceModel.data));
      return animal;
    } else {
      return null;
    }
  }

  // Future<int?>? _getNumber() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   return 5;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Rand Animal")),
        body: FutureBuilder(
          future: _getAnimal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Animal animal = snapshot.data as Animal;
              return Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image.network(
                      animal.imageLink ?? "",
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(animal.name ?? "-"),
                          Text(animal.latinName ?? "-"),
                          Text(animal.habitat ?? "-"),
                          Text(animal.diet ?? "-"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Container(
                  height: 120,
                  width: 120,
                  color: Colors.green,
                  child: Center(child: Text("Error")),
                ),
              );
            }
          },
        ));
  }
}
