import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final String name;
  final String message;
  final bool isSpam;

  const MessageItem({
    super.key,
    required this.name,
    required this.message,
    this.isSpam = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSpam ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          // Profile Circle
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          const SizedBox(width: 12),
          // Message Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Notification or Edit Icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSpam ? Colors.red[400] : Colors.green[100],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isSpam
                  ? Text(
                      "1",
                      style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "1",
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
