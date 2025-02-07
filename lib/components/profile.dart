import 'package:flutter/material.dart';
import 'package:spam_detector/pages/settings_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[700] : Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
            child: Icon(Icons.person,
                size: 50, color: isDark ? Colors.grey[300] : Colors.grey[600]),
          ),
          SizedBox(height: 16),

          // User Name
          Text(
            "User Name",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),

          // Action Buttons
          ListTile(
            leading: Icon(Icons.edit,
                color: isDark ? Colors.grey[100] : Colors.black),
            title: Text('Edit Profile'),
            onTap: () {
              // Handle edit profile
            },
          ),
          ListTile(
            leading: Icon(Icons.settings,
                color: isDark ? Colors.grey[100] : Colors.black),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text('Delete Account', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Handle delete account
            },
          ),
        ],
      ),
    );
  }
}
