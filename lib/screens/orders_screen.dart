import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          orderCard(
            "Ayam Geprek",
            "Rp 12.000",
            "Selesai",
            Colors.green,
          ),
          orderCard(
            "Pizza Galaxi",
            "Rp 15.000",
            "Diproses",
            Colors.orange,
          ),
          orderCard(
            "Momoyo",
            "Rp 9.000",
            "Dikirim",
            Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget orderCard(
    String title,
    String price,
    String status,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.fastfood),
        ),
        title: Text(title),
        subtitle: Text(price),
        trailing: Chip(
          label: Text(status),
          backgroundColor: color.withOpacity(0.2),
        ),
      ),
    );
  }
}