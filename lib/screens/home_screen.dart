import 'package:flutter/material.dart';
import '../models/food.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Food> cart = [];

  // Data makanan (ganti imagePath dengan asset kamu sendiri)
  final List<Map<String, dynamic>> foods = [
  {
    'name': 'Rendang',
    'description': 'Daging rendang khas Padang dengan bumbu...',
    'price': 18000.0,
    'imagePath': 'assets/rendang.png',
  },
  {
    'name': 'Ayam Pop',
    'description': 'Ayam pop lembut dengan sambal khas Padang.',
    'price': 17000.0,
    'imagePath': 'assets/ayam_pop.png',
  },
  {
    'name': 'Dendeng Balado',
    'description': 'Dendeng sapi dengan balado pedas khas...',
    'price': 20000.0,
    'imagePath': 'assets/dendeng_balado.png',
  },
  {
    'name': 'Gulai Tunjang',
    'description': 'Tunjang sapi dengan kuah gulai kental...',
    'price': 22000.0,
    'imagePath': 'assets/gulai_tunjang.png',
  },
];
  void addToCart(String name, double price) {
    setState(() {
      cart.add(
        Food(
          id: cart.length + 1,
          name: name,
          image: '',
          price: price,
          description: '',
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name ditambahkan ke keranjang'),
      ),
    );
  }

  // Format harga jadi Rp 18.000
  String formatPrice(double price) {
    return 'Rp ${price.toInt().toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  Widget sectionTitle(String title) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartScreen(
                cartItems: cart,
              ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "IMMANGFOD",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // SEARCH
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
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

              sectionTitle("Flash Sale"),

              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
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

              // MENU MAKANAN (GRID 2 KOLOM)
              sectionTitle("Menu Makanan"),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return FoodCard(
                      name: food['name'],
                      description: food['description'],
                      price: food['price'],
                      imagePath: food['imagePath'],
                      onAdd: () => addToCart(
                        food['name'],
                        food['price'],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== WIDGET MENU FITUR ==========
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

// ========== WIDGET PROMO CARD ==========
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
    String imagePath = '';

    if (title == 'Wednesday Feast') {
      imagePath = 'assets/wednesday_feast.png';
    } else if (title == 'Flash Sale') {
      imagePath = 'assets/flash_sale.png';
    } else {
      imagePath = 'assets/great_offers.png';
    }

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: 140,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            width: 140,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black54,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
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
          ),
        ],
      ),
    );
  }
}

// ========== WIDGET FOOD CARD (MODEL BARU) ==========
class FoodCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final VoidCallback onAdd;

  const FoodCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar makanan
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback jika gambar tidak ditemukan
                return Container(
                  height: 140,
                  width: double.infinity,
                  color: const Color(0xFFFFE0B2),
                  child: const Icon(
                    Icons.restaurant,
                    size: 50,
                    color: Colors.orange,
                  ),
                );
              },
            ),
          ),

          // Konten card
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama makanan
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),

                // Deskripsi (max 2 baris)
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF757575),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),

                // Harga & Tombol Tambah
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp ${price.toInt().toString().replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]}.',
                      )}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5722),
                      ),
                    ),
                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5722),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}