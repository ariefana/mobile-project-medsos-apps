// lib/pages/messages_page.dart
import 'package:flutter/material.dart';
import '../models.dart'; // Impor model data Chat
import 'chat_detail_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  // Data dummy untuk daftar pesan
  final List<Chat> chats = [
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=11', name: 'maulana D luffy', lastMessage: 'Hay apakabar...', time: '1 Jam'),
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=12', name: 'panji petualang', lastMessage: 'Hay apakabar...', time: '2 Jam'),
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=13', name: 'rizky lahir batin', lastMessage: 'Hay apakabar...', time: '3 Jam'),
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=14', name: 'pak wa', lastMessage: 'Hay apakabar...', time: '4 Jam'),
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=15', name: 'rendy panjang', lastMessage: 'Hay apakabar...', time: '5 Jam'),
    Chat(imageUrl: 'https://i.pravatar.cc/150?img=16', name: 'fariz anak jalanan', lastMessage: 'Hay apakabar...', time: '6 Jam'),
  ];

  // --- PERUBAHAN DIMULAI DI SINI ---

  // 1. Variabel state untuk melacak tab yang aktif
  bool _isInboxSelected = true;

  BoxDecoration colorDecoration = BoxDecoration(
    gradient: LinearGradient(colors: [
      Color.fromRGBO(36, 88, 72, 100),
      Color.fromRGBO(48, 186, 78, 100),
    ]),
    borderRadius: BorderRadius.circular(30.0)
  );

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color.fromARGB(255, 36, 105, 40);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Halaman (Tetap)
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Text(
                'Pesan',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),

            // Search Bar (Tetap)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: colorDecoration,
                child: TextField(
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  ),
                ),
              ),
            ),

            // 2. Tombol Tab yang Diperbarui dengan setState
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  _buildTabButton(
                    'Kotak masuk',
                    _isInboxSelected, // Aktif jika _isInboxSelected == true
                    primaryGreen,
                    () {
                      setState(() {
                        _isInboxSelected = true;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  _buildTabButton(
                    'Permintaan',
                    !_isInboxSelected, // Aktif jika _isInboxSelected == false
                    primaryGreen,
                    () {
                      setState(() {
                        _isInboxSelected = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            // 3. Tampilan Konten yang Berubah (Conditional UI)
            // Jika _isInboxSelected true, tampilkan daftar pesan.
            // Jika false, tampilkan halaman permintaan.
            _isInboxSelected
                ? _buildInboxList() 
                : _buildRequestsEmpty(),
                
          ],
        ),
      ),
    );
  }

  // 4. Widget helper untuk tombol tab (diperbarui untuk menerima onPressed)
  Widget _buildTabButton(String text, bool isSelected, Color color, VoidCallback onPressed) {
    return isSelected
        ? ElevatedButton(
            onPressed: onPressed, // <-- Terapkan fungsi onPressed
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
            onPressed: onPressed, // <-- Terapkan fungsi onPressed
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

  // 5. Widget helper baru untuk menampilkan daftar Kotak Masuk
  Widget _buildInboxList() {
    return Expanded(
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
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ChatDetailPage(
                  name: chat.name, 
                  imageUrl: chat.imageUrl
                  ),
                  )
                );
            },
          );
        },
      ),
    );
  }

  // 6. Widget helper baru untuk menampilkan halaman Permintaan yang kosong
  Widget _buildRequestsEmpty() {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            'Belum ada yang bisa dilihat di sini',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ),
      ),
    );
  }
}