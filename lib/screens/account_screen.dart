import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun Saya"),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: const [
          SizedBox(height: 30),

          CircleAvatar(
            radius: 50,
            child: Icon(
              Icons.person,
              size: 60,
            ),
          ),

          SizedBox(height: 15),

          Center(
            child: Text(
              "Firmanzyah",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 30),

          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Profil"),
          ),

          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text("Alamat"),
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Riwayat Pesanan"),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Pengaturan"),
          ),
        ],
      ),
    );
  }
}