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
  // Store selected colors for the theme
  Color primaryColor = Colors.purple;
  Color buttonColor = Colors.deepPurpleAccent;
  Color cardColor = Colors.deepPurple[50]!;

  // A method used by the settings to update the colors of the elements
  void updateTheme({Color? newPrimary, Color? newButton, Color? newCard}) {
    setState(() {
      if (newPrimary != null) primaryColor = newPrimary;
      if (newButton != null) buttonColor = newButton;
      if (newCard != null) cardColor = newCard;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'FlexDash',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 18),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          color: cardColor,
          elevation: 6,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),

      // Initializing the routes of pages, which will be used later with Navigator
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'FlexDash'),
        '/dashboard': (context) => const Dashboard(),
        '/details': (context) => const DetailsPage(),
        '/settings': (context) => Settings(onThemeChanged: updateTheme),
      },
    );
  }
}


