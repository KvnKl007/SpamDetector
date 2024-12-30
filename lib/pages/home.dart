import 'package:flutter/material.dart';
import 'package:spam_detector/components/appbar.dart';
import 'package:spam_detector/components/message_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPrimaryTab = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Navbar
            Navbar(title: "Messages"),

            // Tabs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isPrimaryTab = true),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isPrimaryTab ? Color(0xFFFFD33D) : Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Primary sms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isPrimaryTab ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isPrimaryTab = false),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              !isPrimaryTab ? Color(0xFFFFD33D) : Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'Spam sms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: !isPrimaryTab ? Colors.black : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Messages List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MessageItem(
                    name: "Divine",
                    message: "Hey there !!",
                    isSpam: !isPrimaryTab,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xFFFFD33D),
        child: Icon(
          Icons.edit,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
