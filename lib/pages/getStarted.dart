import 'package:flutter/material.dart';
import 'package:spam_detector/components/button.dart';
import 'package:spam_detector/pages/home.dart';

class getStarted extends StatelessWidget {
  const getStarted({super.key});

  // Home navigator
  void _navigateHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFD33D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.2),
              Image.asset('lib/assets/MTN.png'),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'SpamSheild SMS',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              Text(
                'SMS Spam filtering',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              MyButton(
                label: "Get Started",
                onTap: () {
                  _navigateHome(context);
                },
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
