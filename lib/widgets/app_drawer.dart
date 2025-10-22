// lib/widgets/app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // const Color primaryGreen = Color(0xFF2E7D32);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Kabar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(36, 88, 72, 100),
                Color.fromRGBO(48, 186, 78, 100),
              ])
            ),
          ),
          // _buildDrawerItem(
          //   icon: Icons.person_outline,
          //   text: 'Profil',
          //   onTap: () => Navigator.pop(context),
          // ),
          // _buildDrawerItem(
          //   icon: Icons.notifications_none,
          //   text: 'Pemberitahuan',
          //   onTap: () => Navigator.pop(context),
          // ),
          // _buildDrawerItem(
          //   icon: Icons.people_outline,
          //   text: 'Teman',
          //   onTap: () => Navigator.pop(context),
          // ),
          // const Divider(),
          _buildDrawerItem(
            
            text: 'Untuk anda',
            onTap: () => Navigator.pop(context),
          ),
          _buildDrawerItem(
            
            text: 'Mengikuti',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Helper method untuk item di dalam Drawer
  Widget _buildDrawerItem({
    
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      
      title: Text(text),
      onTap: onTap,
    );
  }
}