import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/screens/hw1/widgets/carousel_slider_widget.dart';
import 'package:flutter_course/screens/hw1/widgets/orders_status_widget.dart';

class Hw1HomeScreen extends StatefulWidget {
  @override
  State<Hw1HomeScreen> createState() => _Hw1HomeScreenState();
}

class _Hw1HomeScreenState extends State<Hw1HomeScreen> with SingleTickerProviderStateMixin {
  late final OrdersStatusModel preparingOrders, onTheWayOrders;
  late PageController controller;
  late TabController tabController;
  late int pageIndex;
  late String pageTitle;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    pageTitle = pageIndex.title;
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
    controller = PageController(initialPage: pageIndex);
    tabController = TabController(initialIndex: pageIndex, length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: PageView(
        controller: controller,
        onPageChanged: (int i) {
          setState(() {
            pageIndex = i;
            pageTitle = pageIndex.title;
          });
          tabController.animateTo(pageIndex);
        },
        children: [
          _buildPageContent(),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        activeColor: Colors.green,
        color: Colors.grey,
        controller: tabController,
        items: [TabItem(icon: Icons.home, title: 'Home'), TabItem(icon: Icons.map, title: 'Discovery')],
        initialActiveIndex: pageIndex,
        onTap: (int i) {
          setState(() {
            pageIndex = i;
            pageTitle = pageIndex.title;
          });
          controller.jumpToPage(pageIndex);
        },
      ),
    );
  }

  Container _buildPageContent() {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          _buildOrdersPart(),
          SizedBox(height: 24),
          CarouselSliderWidget(),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  AppBar get _appBar => AppBar(
        title: Text(pageTitle),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      );

  Widget _buildOrdersPart() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrdersStatusWidget(status: preparingOrders),
          SizedBox(width: 20),
          OrdersStatusWidget(status: onTheWayOrders),
        ],
      );
}

extension IntExt on int {
  String get title {
    if (this == 0)
      return "Ana Sayfa";
    else if (this == 1)
      return "Kesfet";
    else
      return "Ekle";
  }
}
