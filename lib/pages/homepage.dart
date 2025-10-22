// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart'; // Impor drawer
import '../widgets/post_card.dart'; // Impor post card
import 'add_post_page.dart';

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
      ),
    
      // Panggil widget AppDrawer
      drawer: const AppDrawer(),
    
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: const [
          // Panggil widget PostCard dengan data yang relevan
          PostCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=10',
            userName: 'Arief Mudasir',
            timeAgo: '30 menit',
            postText:
                'Imagine negara loe kebijakan politiknya carut marut, hukumnya amburadul, ekonominya sakaratul maut dan satu-satunya harapan loe buat bangga bisa jadi orang Indonesia malah begini\nGini amat jadi WNI\n\n#kluivertOut',
            postImageUrl:
                'https://cdn1-production-images-kly.akamaized.net/2_Wr9hn8CLEPUtRDvbDxu5nkDTw=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4820086/original/052090700_1714670345-16_000_34QN9ME.jpg',
          ),
          PostCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=11',
            userName: 'Tunde ednut',
            timeAgo: '30 menit',
            postText:
                'yang wajib di ajarkan ke anak\n'
                '• ilmu agama\n'
                '• utamakan pendidikan\n'
                '• kalo bapak lagi ada tamu jangan sengaja minta duit ya nak',
          ),
          PostCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=3',
            userName: 'Jdm japan',
            timeAgo: '30 menit',
            postText: '2002 Nissan Skyline GTR R34 🚗💨',
            postImageUrl:
                'https://premiumcarsjakarta.com/wp-content/uploads/2025/01/NISSAN-GT-WHITE-27122024PCJ-03886-876x535.jpg',
          ),
          PostCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=13',
            userName: 'nadScaine',
            timeAgo: '18 jam',
            postText:
                'udah rajin-rajin ngerjain Skripsi eh ke distract roblox wkwkwk 😭🙏🤣',
          ),
          PostCard(
            profileImageUrl: 'https://i.pravatar.cc/150?img=7',
            userName: 'Kobi',
            timeAgo: '20 menit',
            postText: 'First player that comes to mind?',
            postImageUrl:
                'https://golhiburan.com/wp-content/uploads/2024/04/Jersey-Manchester-United-1999-Melihat-Kembali-Era-Kejayaan-Setan-Merah-1.png',
          ),
        ],
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPostPage()),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
