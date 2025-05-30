import './pages/dashboard.dart';
import 'package:flutter/material.dart';
import './pages/homepage.dart';
import './pages/settings.dart';
import './pages/detailspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentTheme = 'Purple';

  // A map for the colors of the primary color of the application
  final Map<String, Color> primaryColorMap = {
    'Purple': Colors.deepPurple,
    'Teal': Colors.teal.shade800,
    'Orange': Colors.deepOrange.shade800,
  };

  // A map for the color of the top appbar
  final Map<String, Color> appbarColorMap = {
    'Purple': Colors.deepPurple,
    'Teal': Colors.teal.shade800,
    'Orange': Colors.deepOrange.shade800,
  };

  // A map for the color of the buttons
  final Map<String, Color> buttonColorMap = {
    'Purple': Colors.deepPurple.shade400,
    'Teal': Colors.teal.shade400,
    'Orange': Colors.deepOrange.shade400,
  };

  // A map for the color of the cards
  final Map<String, Color> cardColorMap = {
    'Purple': Colors.deepPurple[50]!,
    'Teal': Colors.teal[50]!,
    'Orange': Colors.deepOrange[50]!,
  };

  // Using a setState updates the value of the state and re-renders the widgets
  void updateTheme(String newTheme) {
    setState(() {
      currentTheme = newTheme;
    });
  }



  @override
  Widget build(BuildContext context) {
    final primaryColor = primaryColorMap[currentTheme]!;
    final buttonColor = buttonColorMap[currentTheme]!;
    final cardColor = cardColorMap[currentTheme]!;
    final appBarColor = appbarColorMap[currentTheme]!;

    return MaterialApp(
      title: 'FlexDash',
      theme: ThemeData(
        fontFamily: 'Oswald',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
          titleTextStyle: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 4,
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 18, fontFamily: 'Oswald'),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: cardColor,
          elevation: 10,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),

      // Initializing the routes of pages, which will be used later with named route navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'FlexDash'),
        '/dashboard': (context) => const Dashboard(),
        '/details': (context) => const DetailsPage(),
        '/settings': (context) => Settings(
          onThemeChanged: (String newTheme) {
            updateTheme(newTheme);
          },
          currentTheme: currentTheme,
        ),
      },
    );
  }
}


