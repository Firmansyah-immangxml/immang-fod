import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const ImmangfodApp());
}

class ImmangfodApp extends StatelessWidget {
  const ImmangfodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMMANGFOD',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MainScreen(),
    );
  }
}