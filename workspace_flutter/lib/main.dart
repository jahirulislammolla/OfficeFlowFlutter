
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OrderPage(),
  ));
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;
  int stock = 5;
  double price = 1500;

  String status = 'pending';

  double calculateDiscount(double amount) {
    if (amount >= 10000) {
      return 20;
    } else if (amount >= 5000) {
      return 10;
    } else if (amount >= 2000) {
      return 5;
    }

    return 0;
  }

  String getStatusMessage() {
    switch (status) {
      case 'pending':
        return 'Order is pending';
      case 'processing':
        return 'Order is processing';
      case 'shipped':
        return 'Order has been shipped';
      case 'delivered':
        return 'Order delivered successfully';
      default:
        return 'Unknown status';
    }
  }

  @override
  Widget build(BuildContext context) {
    final subtotal = price * quantity;
    final discount = calculateDiscount(subtotal);
    final total = subtotal - (subtotal * discount / 100);

    final isStockAvailable = quantity <= stock;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available Stock: $stock'),

            const SizedBox(height: 15),

            Text('Quantity: $quantity'),

            Row(
              children: [
                ElevatedButton(
                  onPressed: quantity > 1
                      ? () {
                          setState(() {
                            quantity--;
                          });
                        }
                      : null,
                  child: const Text('-'),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Text('+'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text('Subtotal: $subtotal'),
            Text('Discount: $discount%'),

            Text(
              'Total: ${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            Text(
              isStockAvailable
                  ? 'Stock Available'
                  : 'Insufficient Stock',
              style: TextStyle(
                color: isStockAvailable
                    ? Colors.green
                    : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: status,
              items: [
                'pending',
                'processing',
                'shipped',
                'delivered',
              ].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    status = value;
                  });
                }
              },
            ),

            Text(getStatusMessage()),
          ],
        ),
      ),
    );
  }
}
