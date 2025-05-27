import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The top bar of the application, stating the name of the app
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // Create a new column in the middle of the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add a text to welcome the user
            const Text("Welcome to FlexDash, let's get organized."),
            const SizedBox(height: 20),
            // Add a button to navigate to the dashboard
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Go to the dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}