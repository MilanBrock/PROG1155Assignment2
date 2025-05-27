import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final void Function({Color? newPrimary, Color? newButton, Color? newCard}) onThemeChanged;

  const Settings({super.key, required this.onThemeChanged});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _selectedTheme = 'Purple';
  String _selectedButtonColor = 'Purple';
  String _selectedCardColor = 'Purple';

  final Map<String, Color> colorMap = {
    'Purple': Colors.purple,
    'Teal': Colors.teal,
    'Orange': Colors.orange,
  };

  final List<String> _colors = ['Purple', 'Teal', 'Orange'];

  void _updateTheme() {
    widget.onThemeChanged(
      newPrimary: colorMap[_selectedTheme],
      newButton: colorMap[_selectedButtonColor],
      newCard: colorMap[_selectedCardColor]?.withOpacity(0.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customize your experience",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Color theme
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Theme color"),
                DropdownButton<String>(
                  value: _selectedTheme,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTheme = newValue!;
                      _updateTheme();
                    });
                  },
                  items: _colors
                      .map<DropdownMenuItem<String>>(
                        (String lang) => DropdownMenuItem<String>(
                      value: lang,
                      child: Text(lang),
                    ),
                  )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
