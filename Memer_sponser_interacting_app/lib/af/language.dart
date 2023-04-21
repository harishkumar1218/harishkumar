import 'package:flutter/material.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({Key? key}) : super(key: key);

  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String _selectedLanguage = 'English';

  final List<String> _languageOptions = [
    'English',
    // 'Spanish',
    // 'French',
    // 'German'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Language Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Select your preferred language:',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _languageOptions.length,
            itemBuilder: (context, index) {
              final language = _languageOptions[index];
              return RadioListTile<String>(
                title: Text(language),
                value: language,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  // Call your logic to update the app's language here.
                  print('Selected language: $_selectedLanguage');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
