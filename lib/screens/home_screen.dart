import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Keranjang Belanja'),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.amber,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(width: 10),
                        Text(
                          "IMMANGFOD",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Baurung",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // SEARCH
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari makanan favorit...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // MENU FITUR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    menuItem(Icons.local_drink, "Minuman"),
                    menuItem(Icons.card_giftcard, "Bonus"),
                    menuItem(Icons.discount, "Hemat"),
                    menuItem(Icons.people, "Teman"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // VOUCHER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Voucher Pengguna Baru",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Diskon hingga 50% untuk pesanan pertama",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // FLASH SALE
              sectionTitle("Flash Sale"),

              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: const [
                    PromoCard(
                      title: "Wednesday Feast",
                      color: Colors.orange,
                    ),
                    PromoCard(
                      title: "Flash Sale",
                      color: Colors.red,
                    ),
                    PromoCard(
                      title: "Great Offers",
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // RESTORAN
              sectionTitle("Promo di Sekitarmu"),

              restaurantCard(
                "Momoyo",
                "Diskon 40%",
                "⭐ 4.8",
                "Rp 9.000",
              ),

              restaurantCard(
                "Pizza Galaxi",
                "Diskon 30%",
                "⭐ 4.7",
                "Rp 15.000",
              ),

              restaurantCard(
                "Ayam Geprek",
                "Diskon 25%",
                "⭐ 4.9",
                "Rp 12.000",
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget restaurantCard(
    String name,
    String promo,
    String rating,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 28,
            child: Icon(Icons.restaurant),
          ),
          title: Text(name),
          subtitle: Text("$rating\n$promo"),
          trailing: Text(
            price,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

Widget menuItem(IconData icon, String title) {
  return Column(
    children: [
      CircleAvatar(
        radius: 28,
        backgroundColor: Colors.amber.shade100,
        child: Icon(
          icon,
          color: Colors.orange,
        ),
      ),
      const SizedBox(height: 8),
      Text(title),
    ],
  );
}

class PromoCard extends StatelessWidget {
  final String title;
  final Color color;

  const PromoCard({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}