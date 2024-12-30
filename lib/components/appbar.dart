import 'package:flutter/material.dart';
import 'package:spam_detector/components/profile.dart';

class Navbar extends StatelessWidget {
  final String title;
  final VoidCallback onSearchTap;

  const Navbar({
    super.key,
    required this.title,
    required this.onSearchTap,
  });

  void _showProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Profile(),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onSearchTap,
            child: Icon(Icons.search),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => _showProfile(context),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
