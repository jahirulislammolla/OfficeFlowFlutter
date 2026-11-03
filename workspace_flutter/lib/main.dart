import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: OrderPage()),
  );
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;
  int stock = 10;
  double price = 2000;

  String status = 'delivered';

  final products = [
    (name: 'Keyboard', stock: 10),
    (name: 'Mouse', stock: 0),
    (name: 'Monitor', stock: 5),
    (name: 'Headphones', stock: 0),
  ];

  Color getStatusColor() {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

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

    final isStockAvailable = stock > 0 && quantity > 0 && quantity <= stock;
    final inStockProducts = products.where((product) => product.stock > 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Order Management')),
      body: SingleChildScrollView(
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
              stock <= 0
                  ? 'Out of Stock'
                  : isStockAvailable
                  ? 'Stock Available'
                  : 'Insufficient Stock',
              style: TextStyle(
                color: isStockAvailable ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isStockAvailable
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order placed successfully'),
                        ),
                      );
                    }
                  : null,
              child: const Text('Order'),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: status,
              items: ['pending', 'processing', 'shipped', 'delivered'].map((
                item,
              ) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    status = value;
                  });
                }
              },
            ),

            Text(getStatusMessage(), style: TextStyle(color: getStatusColor())),

            const SizedBox(height: 20),
            const Text(
              'In Stock Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            if (inStockProducts.isEmpty)
              const Text('No products in stock')
            else
              ...inStockProducts.map(
                (product) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(product.name),
                  subtitle: Text('Available Stock: ${product.stock}'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
