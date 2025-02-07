import 'package:flutter/material.dart';
import 'package:spam_detector/components/message_item.dart';

class MessageList extends StatelessWidget {
  final bool isSpam;
  final String searchQuery;
  final List<Map<String, String>> messages;

  const MessageList({
    super.key,
    required this.isSpam,
    required this.searchQuery,
    required this.messages,
  });

  List<Map<String, String>> get filteredMessages {
    if (searchQuery.isEmpty) return messages;
    return messages.where((message) {
      return message["name"]!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          message["message"]!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemCount: filteredMessages.length,
      itemBuilder: (context, index) {
        final message = filteredMessages[index];
        return Column(
          children: [
            MessageItem(
              name: message["name"]!,
              message: message["message"]!,
              isSpam: isSpam,
            ),
          ],
        );
      },
    );
  }
}
