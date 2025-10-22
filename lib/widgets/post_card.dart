// lib/widgets/post_card.dart
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String timeAgo;
  final String postText;
  final String? postImageUrl;

  const PostCard({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.timeAgo,
    required this.postText,
    this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Postingan
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Teks Status
            Text(postText, style: const TextStyle(fontSize: 16, height: 1.4)),
            const SizedBox(height: 12),

            // Gambar Utama (jika ada)
            if (postImageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  postImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
            
            Divider(height: 20, color: Colors.grey[200]),

            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildActionButton(icon: Icons.favorite_border, label: 'Suka', onTap: () {}),
                const SizedBox(width: 20),
                _buildActionButton(
                    icon: Icons.chat_outlined, label: 'Komentar', onTap: () {}),
                const SizedBox(width: 20),
                _buildActionButton(
                    icon: Icons.share, label: 'Bagikan', onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, required onTap}) {
    return Row(
      children: [
        // Icon(icon, size: 20, color: Colors.black),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon, size: 20, color: Colors.black,
          ),
        ),
        const SizedBox(width: 0),
        Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}