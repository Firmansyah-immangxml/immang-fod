import 'package:flutter/material.dart';
import '../models/order_data.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
        backgroundColor: Colors.amber,
      ),
      body: OrderData.orders.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Belum ada pesanan",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: OrderData.orders.length,
              itemBuilder: (context, index) {
                final food = OrderData.orders[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderDetailScreen(
                          name: food.name,
                          price: food.price,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.fastfood),
                      ),
                      title: Text(food.name),
                      subtitle: Text(
                        'Rp ${food.price.toStringAsFixed(0)}',
                      ),
                      trailing: Chip(
                        label: const Text("Diproses"),
                        backgroundColor: Colors.orange.shade100,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}