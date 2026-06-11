import 'package:flutter/material.dart';
import '../models/food.dart';

class CartScreen extends StatelessWidget {
  final List<Food> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var item in cartItems) {
      total += item.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.amber,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Keranjang masih kosong',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final food = cartItems[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.fastfood,
                            size: 35,
                          ),
                          title: Text(food.name),
                          subtitle: Text(
                            'Rp ${food.price.toStringAsFixed(0)}',
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Total : Rp ${total.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    'Konfirmasi Pembayaran',
                                  ),
                                  content: Text(
                                    'Total pembayaran Anda adalah Rp ${total.toStringAsFixed(0)}',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Pembayaran Berhasil 🎉',
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Bayar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            'CHECKOUT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}