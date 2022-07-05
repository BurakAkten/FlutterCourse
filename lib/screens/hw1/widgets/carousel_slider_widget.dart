import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Container(
            width: 400,
            child: Image.network("https://picsum.photos/300", fit: BoxFit.fill),
          ),
          Container(
            width: 400,
            child: Image.network("https://picsum.photos/400", fit: BoxFit.fill),
          ),
          Container(
            width: 400,
            child: Image.network("https://picsum.photos/200", fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
