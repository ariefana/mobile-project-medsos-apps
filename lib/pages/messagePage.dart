// lib/pages/messages_page.dart
import 'package:flutter/material.dart';
import '../models.dart'; // Impor model data Chat

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  // Data dummy untuk daftar pesan
  final List<Chat> chats = [
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=11',
      name: 'Maulana D luffy',
      lastMessage: 'Hay apakabar...',
      time: '1 Jam',
    ),
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=12',
      name: 'Panji petualang',
      lastMessage: 'Hay apakabar...',
      time: '2 Jam',
    ),
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=13',
      name: 'Rizky lahir batin',
      lastMessage: 'Hay apakabar...',
      time: '3 Jam',
    ),
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=14',
      name: 'Pak wa',
      lastMessage: 'Hay apakabar...',
      time: '4 Jam',
    ),
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=15',
      name: 'Rendy panjang',
      lastMessage: 'Hay apakabar...',
      time: '5 Jam',
    ),
    Chat(
      imageUrl: 'https://i.pravatar.cc/150?img=16',
      name: 'Fariz anak jalanan',
      lastMessage: 'Hay apakabar...',
      time: '6 Jam',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF2E7D32);

    // Variable untuk warna gradient
    BoxDecoration gradientColor = BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(36, 88, 72, 100),
          Color.fromRGBO(48, 186, 78, 100),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Halaman
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Text(
                'Pesan',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: gradientColor,
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari',
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
            ),

            // Tombol Tab: Kotak Masuk & Permintaan
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  _buildTabButton('Kotak masuk', true, primaryGreen),
                  const SizedBox(width: 10),
                  _buildTabButton('Permintaan', false, primaryGreen),
                ],
              ),
            ),

            // Daftar Pesan
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(chat.imageUrl),
                    ),
                    title: Text(
                      chat.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${chat.lastMessage} • ${chat.time}'),
                    onTap: () {
                      // Aksi saat chat di-tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk tombol tab
  Widget _buildTabButton(String text, bool isSelected, Color color) {
    return isSelected
        ? ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(text),
          )
        : OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text(text),
          );
  }
}
