import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spam_detector/providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _spamProtectionEnabled = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD33D),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          // Theme Settings
          _buildSection(
            'Appearance',
            [
              ListTile(
                title: Text('Theme'),
                subtitle: Text(_getThemeText(themeProvider.themeMode)),
                leading: Icon(Icons.palette_outlined),
                onTap: () => _showThemeDialog(themeProvider),
              ),
            ],
          ),

          // Notifications
          _buildSection(
            'Notifications',
            [
              SwitchListTile(
                title: Text('Enable Notifications'),
                subtitle: Text('Receive alerts for new messages'),
                secondary: Icon(Icons.notifications_outlined),
                value: _notificationsEnabled,
                activeColor: Colors.white,
                activeTrackColor: Colors.blue,
                onChanged: (value) {
                  setState(() => _notificationsEnabled = value);
                },
              ),
            ],
          ),

          // Spam Protection
          _buildSection(
            'Security',
            [
              SwitchListTile(
                title: Text('Spam Protection'),
                subtitle: Text('Automatically filter suspicious messages'),
                secondary: Icon(Icons.security_outlined),
                value: _spamProtectionEnabled,
                activeColor: Colors.white,
                activeTrackColor: Colors.blue,
                onChanged: (value) {
                  setState(() => _spamProtectionEnabled = value);
                },
              ),
            ],
          ),

          // About & Policies
          _buildSection(
            'About',
            [
              ListTile(
                title: Text('About SpamShield'),
                leading: Icon(Icons.info_outline),
                onTap: () {
                  // Navigate to About page
                },
              ),
              ListTile(
                title: Text('Privacy Policy'),
                leading: Icon(Icons.privacy_tip_outlined),
                onTap: () {
                  // Navigate to Privacy Policy
                },
              ),
              ListTile(
                title: Text('Terms of Service'),
                leading: Icon(Icons.description_outlined),
                onTap: () {
                  // Navigate to Terms of Service
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
        ...children,
        Divider(),
      ],
    );
  }

  String _getThemeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  void _showThemeDialog(ThemeProvider themeProvider) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<ThemeMode>(
                title: Text('Light'),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  themeProvider.setThemeMode(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('Dark'),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  themeProvider.setThemeMode(value!);
                  Navigator.pop(context);
                },
              ),
              RadioListTile<ThemeMode>(
                title: Text('System'),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: (ThemeMode? value) {
                  themeProvider.setThemeMode(value!);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
