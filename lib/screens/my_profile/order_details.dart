import 'package:flutter/material.dart';
import 'package:food_app/screens/my_profile/ordermodel.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;

  const OrderDetailsPage({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${order.id}'),
            SizedBox(height: 16.0),
            Text('Total Amount: \$${order.total.toStringAsFixed(2)}'),
            SizedBox(height: 16.0),
            Text('Items:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                return Text(order.items[index]);
              },
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement write product review functionality.
                  },
                  child: Text('Write Review'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement view order details functionality.
                  },
                  child: Text('View Details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement download invoice functionality.
                  },
                  child: Text('Download Invoice'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
