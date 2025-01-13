import 'package:flutter/material.dart';
import 'package:sara/screens/order_details.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const OrderDetails(),
          ),
        );
      },
      child: const Text('View Order Details'),
    );
    return const OrderDetails();
  }
}
