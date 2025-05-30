import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  final void Function(String newTheme) onThemeChanged;
  final String currentTheme;

  const Settings({super.key, required this.onThemeChanged, required this.currentTheme});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String _selectedTheme;
  final List<String> _colors = ['Purple', 'Teal', 'Orange'];

  @override
  void initState() {
    super.initState();
    _selectedTheme = widget.currentTheme;
  }

  void _updateTheme() {
    widget.onThemeChanged(_selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
