import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/languages.g.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});
  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  Language _selectedLanguage = Languages.english;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.horizontal(),
        ),
        child: LanguagePickerDropdown(
          initialValue: _selectedLanguage,
          onValuePicked: (Language language) {
            setState(() {
              _selectedLanguage = language;
            });
          },
        ),
      ),
    );
  }
}