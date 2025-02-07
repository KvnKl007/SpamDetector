import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spam_detector/providers/theme_provider.dart';
import 'package:spam_detector/pages/getStarted.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spam Detector',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            primaryColor: Color(0xFFFFD33D),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFFFFD33D),
            ),
            colorScheme: ColorScheme.light(
              primary: Color(0xFFFFD33D),
              secondary: Colors.black,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFFFFD33D),
            scaffoldBackgroundColor: Colors.grey[900],
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFFFFD33D),
            ),
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFFFD33D),
              secondary: Colors.white,
              surface: Colors.grey[850]!,
              background: Colors.grey[900]!,
            ),
            dialogBackgroundColor: Colors.grey[850],
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.grey[900],
            ),
          ),
          home: const getStarted(),
        );
      },
    );
  }
}
