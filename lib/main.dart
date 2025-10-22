// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/main_page.dart'; // Impor halaman utama

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyMainPage(), // Langsung panggil MyMainPage
      debugShowCheckedModeBanner: false,
    );
  }
}