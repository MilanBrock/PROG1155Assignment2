import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the parameters attached to the navigator
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    // Extract the named arguments.
    final String title = args['title'] ?? 'Title not found..';
    final String description = args['description'] ?? 'Description not found..';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // Show the received title and description
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(description, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
