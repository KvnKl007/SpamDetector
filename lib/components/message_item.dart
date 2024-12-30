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
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey[300],
        child: Text(
          name[0],
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        message,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isSpam ? Colors.red[400] : Colors.green[100],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            !isSpam ? "1" : "!",
            style: TextStyle(
              color: isSpam ? Colors.white : Colors.green[800],
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
