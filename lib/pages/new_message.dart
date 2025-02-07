import 'package:flutter/material.dart';

class NewMessagePage extends StatefulWidget {
  const NewMessagePage({super.key});

  @override
  State<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> contacts = [
    {"name": "Divi", "number": "+250 788 123 456"},
    {"name": "Jon", "number": "+250 788 234 567"},
    {"name": "Dine", "number": "+250 788 123 456"},
    {"name": "Joh", "number": "+250 788 234 567"},
    {"name": "Vine", "number": "+250 788 123 456"},
    {"name": "Jn", "number": "+250 788 234 567"},
    {"name": "Dvn", "number": "+250 788 123 456"},
    {"name": "Jhn", "number": "+250 788 234 567"},
    {"name": "Divine", "number": "+250 788 123 456"},
    {"name": "John", "number": "+250 788 234 567"},
    {"name": "Divine", "number": "+250 788 123 456"},
    {"name": "Ohn", "number": "+250 788 234 567"},
    {"name": "Dne", "number": "+250 788 123 456"},
    {"name": "Hn", "number": "+250 788 234 567"},
  ];
  List<Map<String, String>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts.where((contact) {
        return contact["name"]!.toLowerCase().contains(query.toLowerCase()) ||
            contact["number"]!.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFD33D),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Message',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // To Field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: filterContacts,
              decoration: InputDecoration(
                hintText: 'To',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[900] : Colors.grey[100],
              ),
            ),
          ),

          // Contacts List
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      contact["name"]![0],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(contact["name"]!),
                  subtitle: Text(contact["number"]!),
                  onTap: () {
                    // Handle contact selection
                    _searchController.text = contact["name"]!;
                    // You might want to navigate to message composition here
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
