import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // A list of sample cards to show on the screen
  final List<Map<String, String>> items = [
    {
      'title': 'Card 1',
      'description': 'This is the first card description, when it is clicked the entire sentence is visible.',
    },
    {
      'title': 'Card 2',
      'description': 'Here is some info about card two',
    },
    {
      'title': 'Card 3',
      'description': 'Third card is about something cool',
    },
    {
      'title': 'Card 4',
      'description': 'Fourth card is about something cool',
    },
  ];




  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    int subtitleCharLimit = (mediaQuery.size.width / 10).floor(); // Character limit for cards


    return Scaffold(
      // Show that we are now on the dashboard
      appBar: AppBar(title: const Text('Dashboard')),
      body:
      // At first we add a column to vertically align the settings button & cards
      Column(
        children: [
          // Align the settings button to the top right of the screen
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 3),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Image.network("https://img.icons8.com/?size=20&id=2969&format=png&color=000000.png"),
              ),
            )
          ),
          // Place vertically aligned cards under the settings button
          Expanded(
            //
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isLandscape = constraints.maxWidth > constraints.maxHeight;
                final cardWidth = isLandscape
                    ? constraints.maxWidth * 0.5 // Half width in landscape
                    : constraints.maxWidth; // Full width in portrait
                final subtitleCharLimit = (constraints.maxWidth / 10).floor();

                // Create a list in which to put in the cards
                return ListView.builder(
                  // When we are on landscape, list the cards horizontally, otherwise vertically
                  scrollDirection: isLandscape ? Axis.horizontal : Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    // Create a sizedbox to fit the card
                    return SizedBox(
                      width: cardWidth,
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(item['title']!),
                          subtitle: Text(
                            // Show a set amount of text based on the width of the screen.
                            item['description']!.length > subtitleCharLimit
                                ? '${item['description']!.substring(0, subtitleCharLimit)}...'
                                : item['description']!,
                          ),
                          // When tapped, navigate the user to a page where the entire text is visible.
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/details',
                              arguments: {
                                'title': item['title'],
                                'description': item['description'],
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ]
      )

    );
  }
}


