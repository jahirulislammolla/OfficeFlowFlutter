
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShoppingCartPage(),
    );
  }
}

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() =>
      _ShoppingCartPageState();
}

class _ShoppingCartPageState
    extends State<ShoppingCartPage> {

  final String productName = 'Wireless Mouse';

  final double price = 1250.50;

  int quantity = 1;

  double discount = 10;

  @override
  Widget build(BuildContext context) {

    double subtotal = price * quantity;

    double discountAmount =
        subtotal * discount / 100;

    double total = subtotal - discountAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              productName,
              style: const TextStyle(fontSize: 24),
            ),

            Text('Price: $price'),

            const SizedBox(height: 20),

            Text(
              'Quantity: $quantity',
              style: const TextStyle(fontSize: 20),
            ),

            Row(
              children: [

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                  child: const Text('-'),
                ),

                const SizedBox(width: 20),

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

            Text('Discount: $discount%'),

            Slider(
              value: discount,
              min: 0,
              max: 50,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  discount = value;
                });
              },
            ),

            Text('Subtotal: $subtotal'),

            Text('Discount Amount: $discountAmount'),

            const SizedBox(height: 20),

            Text(
              'Total: ${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
