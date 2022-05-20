import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/base/services/base_service.dart';
import 'package:flutter_course/widgets/animal_widget.dart';

import 'models/animal_model.dart';

class AnimalsScreen extends StatefulWidget {
  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  Future<List<Animal?>> _getAnimals() async {
    //  ServiceResponseModel serviceModel = await BaseService().getRequest(BaseService.fifteenAnimalEndPoint);
    // if (serviceModel.isSuccess) {
    //   List<Animal> animals = Animal().listFromJson(jsonDecode(serviceModel.data));
    //   return animals;
    // } else {
    //   return [];
    // }

    //Endpoint broken thats why we use like that.
    List<Animal?> animals = [];
    for (var i = 0; i < 6; i++) animals.add(await _getAnimal());

    return animals;
  }

  Future<Animal?>? _getAnimal() async {
    ServiceResponseModel serviceModel = await BaseService().getRequest(BaseService.randomEndPoint);
    if (serviceModel.isSuccess) {
      Animal animal = Animal.fromJson(jsonDecode(serviceModel.data));
      return animal;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rand Animals")),
      body: FutureBuilder(
        future: _getAnimals(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Animal?> animals = snapshot.data as List<Animal?>;
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var animal in animals)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: AnimalWidget(animal),
                      ),
                  ],
                ),
              ),
            );
            //   ListView.builder(
            //     itemCount: animals.length,
            //     itemBuilder: (context, index) => Container(
            //       margin: const EdgeInsets.symmetric(vertical: 4),
            //       child: AnimalWidget(animals[index]),
            //     ),
            //   ),
            // );
            //   ListView(
            //   children: [
            //     for(var animal in animals)
            //       AnimalWidget(animal);
            //   ],
            // );
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
      ),
    );
  }
}
