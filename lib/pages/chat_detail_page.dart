// import 'dart:ffi';
import 'package:flutter/material.dart';
import '../models.dart'; // Impor model
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  // Data dummy untuk pesan obrolan
  final List<Message> messages = [
    Message(text: 'Hai', isSentByMe: true),
    Message(text: 'Ada apa?', isSentByMe: false),
    Message(text: 'Apa Kabar', isSentByMe: true),
    Message(text: 'Alhamdulillah baik', isSentByMe: false),
    Message(text: 'Oke', isSentByMe: true),
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 231, 231),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        // backgroundColor: primaryGreen,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(36, 88, 72, 100),
              Color.fromRGBO(48, 186, 78, 100),
            ])
          ),
        ),
        elevation: 0,
        titleSpacing: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.imageUrl),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'online', // Status online
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () => _showSettingsMenu(context),
          ),
        ],
      ),

      body: Column(
        children: [
          // 1. Area Chat
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: messages.length + 1, // +1 untuk header profil
              itemBuilder: (context, index) {
                // Header Profil di dalam list
                if (index == 0) {
                  return _buildProfileHeader();
                }
                
                // Item Pesan
                final message = messages[index - 1];
                return _buildChatBubble(message);
              },
            ),
          ),

          // 2. Area Input Pesan
          _buildMessageInputBar(primaryGreen),
        ],
      ),
    );
  }

  // Widget helper untuk header profil di tengah
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
          const SizedBox(height: 12),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'online',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk gelembung chat
  Widget _buildChatBubble(Message message) {
    const Color bubbleGreen = Color(0xFF2E7D32);
    
    // Tentukan alignment berdasarkan pengirim
    var alignment = message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft;
    var crossAlignment = message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: crossAlignment,
        children: [
          SizedBox(height: 33,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: bubbleGreen,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk bilah input di bawah
  Widget _buildMessageInputBar(Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 231, 231),
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.black, size: 30),
              onPressed: () => _showAttachmentMenu(context),
            ),
            Expanded(
              child: Container(
                height: 33,
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                decoration: BoxDecoration(
                  // color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(25.0),
                  border: BoxBorder.all(color: Colors.black, width: 1)
                ),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Pesan...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // Anda bisa tambahkan tombol kirim di sini jika mau
            IconButton(
              icon: Icon(LucideIcons.send, color: Colors.black),
              onPressed: () {
                // print(_messageController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Function untuk Modal Bottom Sheet
void _showAttachmentMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(EvaIcons.image, color: Colors.blue,),
              title: const Text('Media', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.gif, color: Colors.amber,),
              title: const Text('Stiker dan GIF', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Ionicons.camera, color: Colors.black,),
              title: const Text('Kamera', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  );
}

// Helper Function untuk Modal Bottom Sheet in setting
void _showSettingsMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              trailing: const Icon(Ionicons.notifications_off, color: Colors.black,),
              title: const Text('Senyapkan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.person_off, color: Colors.red,),
              title: const Text('Blokir', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: const Icon(Icons.report, color: Colors.red,),
              title: const Text('Laporkan', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  );
}