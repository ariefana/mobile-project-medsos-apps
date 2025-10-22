import 'package:flutter/material.dart';
import 'package:medsos_app/pages/homepage.dart';
import 'package:medsos_app/pages/PesanPage.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyMainPage> {
  // Variable state untuk menyimpan index item yang aktif
  int _selectedIndex = 0;

  // List dari semua halaman widget yang akan ditampilkan
  static const List<Widget> _pages = <Widget>[HomePage(), MessagesPage()];

  // Fungsi untuk mengubah state saat item ditekan
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definisikan dekorasi gradien di sini
    BoxDecoration gradientDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(36, 88, 72, 100),
          Color.fromRGBO(48, 186, 78, 100),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: gradientDecoration,
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Pesan",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notifikasi",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
