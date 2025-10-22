// lib/pages/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(36, 88, 72, 100),
                Color.fromRGBO(48, 186, 78, 100),
              ],
            ),
          ),
        ),
        // backgroundColor: primaryGreen,
        title: Text(
          'Konektif',
          style: TextStyle(
            fontFamily: 'Times New Roman',
            color: Colors.white,
          ),
        ),
        // title: Image.asset(
        //   'images/iconproject.png',
        //   width: 78,
        //   height: 80,
        //   // fit: BoxFit.cover,
        // ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
    
      body: Center(
        child: Text(
          'This Home Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
