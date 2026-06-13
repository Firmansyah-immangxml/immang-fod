import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final String name;
  final double price;

  const OrderDetailScreen({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Status Pesanan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.restaurant,
                  color: Colors.orange,
                  size: 35,
                ),
                title: Text(name),
                subtitle: Text(
                  "Rp ${price.toStringAsFixed(0)}",
                ),
              ),
            ),

            const SizedBox(height: 30),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Icon(Icons.check, color: Colors.white),
              ),
              title: Text("Pesanan sedang diproses"),
            ),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.restaurant, color: Colors.white),
              ),
              title: Text("Restoran sedang menyiapkan"),
            ),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.delivery_dining, color: Colors.white),
              ),
              title: Text("Menunggu kurir"),
            ),

            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.home, color: Colors.white),
              ),
              title: Text("Pesanan selesai"),
            ),
          ],
        ),
      ),
    );
  }
}