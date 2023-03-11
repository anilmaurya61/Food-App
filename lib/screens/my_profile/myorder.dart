import 'package:flutter/material.dart';
import 'package:food_app/screens/my_profile/order_details.dart';
import 'package:food_app/screens/my_profile/ordermodel.dart';

class MyOrderPage extends StatelessWidget {
  final List<Order> orders;

  const MyOrderPage({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: orders.isNotEmpty
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('Order #${order.id}'),
                  subtitle: Text('Total: \$${order.total}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to order details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsPage(order: order),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: Text('No orders yet'),
            ),
    );
  }
}
