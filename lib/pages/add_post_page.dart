import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Tambahkan listener untuk mendeteksi perubahan pada teks
    _textController.addListener(() {
      setState(() {
        // Tombol "Posting" akan aktif jika ada teks yang diketik
        _isButtonEnabled = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: primaryGreen,
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
        // Tombol 'X' untuk kembali
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Utas baru',
          style: TextStyle(color: Colors.white, fontFamily: 'Times'),
        ),
        actions: [
          // Tombol 'Posting' di pojok kanan atas
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      // TODO: Tambahkan logika untuk mengirim postingan
                      print('Postingan: ${_textController.text}');
                      Navigator.pop(context); // Kembali ke home setelah posting
                    }
                  : null, // Tombol non-aktif jika tidak ada teks
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 16, 18, 192),
                disabledBackgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Posting',
                style: TextStyle(fontFamily: 'Times'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=10',
                  ), // Ganti dengan URL gambar profil user
                ),
                const SizedBox(width: 15),
                // TextField akan mengisi sisa ruang yang tersedia
                Expanded(
                  child: TextField(
                    controller: _textController,
                    autofocus: false, // Keyboard langsung muncul
                    maxLines: 10, // Batas maksimal baris sebelum scroll
                    minLines: 1,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: "Apa yang terjadi?",
                      border: InputBorder.none, // Hapus garis bawah
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(), // Mendorong widget di bawahnya ke dasar
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image_outlined, color: Colors.black),
                  onPressed: () {
                    // TODO: Aksi untuk memilih gambar dari galeri
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // TODO: Aksi untuk mengambil gambar dari kamera
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Siapa pun bisa membalas dan mengutip',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
    );
  }
}
