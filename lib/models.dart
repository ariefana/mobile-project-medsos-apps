class Chat {
  final String imageUrl;
  final String name;
  final String lastMessage;
  final String time;

  Chat({
    required this.imageUrl,
    required this.name,
    required this.lastMessage,
    required this.time,
  });
}

class Message {
  final String text;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.isSentByMe,
  });
}