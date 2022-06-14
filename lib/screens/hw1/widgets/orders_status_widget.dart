import 'package:flutter/material.dart';

class OrdersStatusWidget extends StatelessWidget {
  final OrdersStatusModel status;

  const OrdersStatusWidget({Key? key, required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 8,
      child: Container(
        padding: EdgeInsets.only(left: 16),
        height: 120,
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            status.icon,
            Text(
              "${status.status}",
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
            ),
            Text(
              "${status.orderCount} Sipariş",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersStatusModel {
  final Icon icon;
  final String status;
  final int orderCount;

  OrdersStatusModel(this.icon, this.status, this.orderCount);
}
