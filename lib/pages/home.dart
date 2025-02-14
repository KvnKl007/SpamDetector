import 'package:flutter/material.dart';
import 'package:spam_detector/components/appbar.dart';
import 'package:spam_detector/components/message_list.dart';
import 'package:spam_detector/pages/new_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isPrimaryTab = true;
  bool isSearchVisible = false;
  String searchQuery = '';
  late AnimationController _searchAnimationController;
  late Animation<double> _searchAnimation;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _searchAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _searchAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _searchAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _searchAnimationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      isSearchVisible = !isSearchVisible;
      if (isSearchVisible) {
        _searchAnimationController.forward();
      } else {
        _searchAnimationController.reverse();
        searchQuery = ''; // Clear search when hiding search bar
      }
    });
  }

  // Sample message data - you can replace this with your actual data source
  final List<Map<String, String>> messages = [
    {
      "name": "Divine",
      "message": "Hey there !! How are you doing today? Just checking in."
    },
    {"name": "John", "message": "Meeting at 3 PM"},
    {"name": "Alice", "message": "Don't forget about the project deadline"},
    {"name": "Bob", "message": "Check out this new feature"},
    {
      "name": "Divin",
      "message": "Hey there !! How are you doing today? Just checking in."
    },
    {"name": "Ohn", "message": "Meeting at 3 PM"},
    {"name": "Ice", "message": "Don't forget about the project deadline"},
    {"name": "Bb", "message": "Check out this new feature"},
    {
      "name": "Dv",
      "message": "Hey there !! How are you doing today? Just checking in."
    },
    {"name": "Jh", "message": "Meeting at 3 PM"},
    {"name": "Lc", "message": "Don't forget about the project deadline"},
    {"name": "Bb", "message": "Check out this new feature"},
    {
      "name": "Dvne",
      "message": "Hey there !! How are you doing today? Just checking in."
    },
    {"name": "Jhn", "message": "Meeting at 3 PM"},
    {"name": "Alce", "message": "Don't forget about the project deadline"},
    {"name": "Bb", "message": "Check out this new feature"},
    {
      "name": "Divine",
      "message": "Hey there !! How are you doing today? Just checking in."
    },
    {"name": "Jn", "message": "Meeting at 3 PM"},
    {"name": "Ali", "message": "Don't forget about the project deadline"},
    {"name": "Bobo", "message": "Check out this new feature"},
    // Add more messages as needed
  ];

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Navbar
            Navbar(
              title: "Messages",
              onSearchTap: toggleSearch,
            ),

            // Search Input with Animation
            SizeTransition(
              sizeFactor: _searchAnimation,
              axisAlignment: -1,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -0.5),
                  end: Offset.zero,
                ).animate(_searchAnimation),
                child: FadeTransition(
                  opacity: _searchAnimation,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search messages...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: isDark ? Colors.grey[900] : Colors.grey[100],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Tabs
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => isPrimaryTab = true);
                        _pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
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
                      onTap: () {
                        setState(() => isPrimaryTab = false);
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
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

            // PageView for swipeable content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isPrimaryTab = index == 0;
                  });
                },
                children: [
                  // Primary Messages
                  MessageList(
                    isSpam: false,
                    searchQuery: searchQuery,
                    messages: messages,
                  ),
                  // Spam Messages
                  MessageList(
                    isSpam: true,
                    searchQuery: searchQuery,
                    messages: messages,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floating button
      floatingActionButton: isPrimaryTab
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewMessagePage()),
                );
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xFFFFD33D),
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
            )
          : null,
    );
  }
}
