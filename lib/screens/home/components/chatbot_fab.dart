import 'package:flutter/material.dart';

class ChatbotFAB extends StatelessWidget {
  final VoidCallback onPressed;
  const ChatbotFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'chatbot_fab',
      onPressed: onPressed,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.chat),
    );
  }
}
