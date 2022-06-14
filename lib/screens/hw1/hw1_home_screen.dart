import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/screens/hw1/widgets/orders_status_widget.dart';

class Hw1HomeScreen extends StatefulWidget {
  @override
  State<Hw1HomeScreen> createState() => _Hw1HomeScreenState();
}

class _Hw1HomeScreenState extends State<Hw1HomeScreen> {
  late final OrdersStatusModel preparingOrders, onTheWayOrders;

  @override
  void initState() {
    super.initState();
    preparingOrders = OrdersStatusModel(
      Icon(
        Icons.sports_baseball,
        color: Colors.orange,
        size: 26,
      ),
      "Hazırlanıyor",
      12,
    );
    onTheWayOrders = OrdersStatusModel(
      Icon(Icons.face, color: Colors.purple),
      "Yolda",
      8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OrdersStatusWidget(status: preparingOrders),
                SizedBox(width: 20),
                OrdersStatusWidget(status: onTheWayOrders),
              ],
            ),
            SizedBox(height: 24),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
