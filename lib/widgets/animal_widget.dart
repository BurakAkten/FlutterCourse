import 'package:flutter_course/models/animal_model.dart';
import 'package:flutter/material.dart';

class AnimalWidget extends StatelessWidget {
  final Animal? animal;

  AnimalWidget(this.animal);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Image.network(
            animal?.imageLink ?? "",
            // loadingBuilder: (context, child, loadingProgress) {
            //   if (loadingProgress?.cumulativeBytesLoaded < 100) return CircularProgressIndicator.adaptive();
            // },
            // errorBuilder: (context, error, trace) => Image.asset("assets/error.jpg"),
            width: 120,
            height: 120,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnimalProperty(title: "Name: ", value: animal?.name),
                _buildAnimalProperty(title: "Latin Name: ", value: animal?.latinName),
                _buildAnimalProperty(title: "Habitat: ", value: animal?.habitat),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalProperty({String? title, String? value}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text.rich(
          TextSpan(
            text: title ?? "-",
            style: TextStyle(color: Colors.red),
            children: [
              TextSpan(
                text: value ?? "-",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      );
}
