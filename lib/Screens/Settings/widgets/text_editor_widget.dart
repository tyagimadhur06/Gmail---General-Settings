import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key});

  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  String _selectedFontStyle = 'Sans Serif';
  double _selectedTextSize = 16.0; // Default text size
  Color? _selectedTextColor = Colors.black;
  // Default font style
  final List<String> _myGoogleFonts = [
    "Sans Serif", // Default value
    "Abril Fatface",
    "Aclonica",
    "Alegreya Sans",
    "Architects Daughter",
    "Archivo",
    "Archivo Narrow",
    "Bebas Neue",
    "Bitter",
    "Bree Serif",
    "Bungee",
    "Cabin",
    "Cairo",
    "Coda",
    "Comfortaa",
    "Comic Neue",
    "Cousine",
    "Croissant One",
    "Faster One",
    "Forum",
    "Great Vibes",
    "Heebo",
    "Inconsolata",
    "Josefin Slab",
    "Lato",
    "Libre Baskerville",
    "Lobster",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mukta",
    "Nunito",
    "Offside",
    "Open Sans",
    "Oswald",
    "Overlock",
    "Pacifico",
    "Playfair Display",
    "Poppins",
    "Raleway",
    "Roboto",
    "Roboto Mono",
    "Source Sans Pro",
    "Space Mono",
    "Spicy Rice",
    "Squada One",
    "Sue Ellen Francisco",
    "Trade Winds",
    "Ubuntu",
    "Varela",
    "Vollkorn",
    "Work Sans",
    "Zilla Slab",
  ];
  final List<String> _textSizes = ["Small", "Medium", "Large", "Huge"];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: Card(
        surfaceTintColor: Colors.white54,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Dropdown for Font Style
              DropdownButton<String>(
                value: _selectedFontStyle,
                items: _myGoogleFonts.map((font) {
                  return DropdownMenuItem<String>(
                    value: font, // Ensure each value is unique
                    child: Text(font),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFontStyle = value!;
                    // Update the default text style here
                  });
                },
              ),
              SizedBox(height: 10.0),
              // Dropdown for Text Size
              DropdownButton<String>(
                value: _textSizes[_getSizeTextIndex(_selectedTextSize)],
                items: _textSizes.map((size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTextSize = _getSizeFromText(value!);
                    // Update the default text size here
                  });
                },
              ),
              SizedBox(height: 10.0),
              // Color Picker for Text Color
              _buildTextColorPicker(),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    // Reset all settings to default values
                    _selectedFontStyle = 'Sans Serif';
                    _selectedTextSize = 16.0;
                    _selectedTextColor = Colors.black;
                  });
                },
                child: Text('Remove formatting'),
              ),
              SizedBox(height: 20.0),
              Text(
                'This is what your body text will look like.',
                style: TextStyle(
                    fontSize: _selectedTextSize, color: _selectedTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getSizeTextIndex(double size) {
    if (size == 12.0) {
      return 0;
    } else if (size == 16.0) {
      return 1;
    } else if (size == 20.0) {
      return 2;
    } else if (size == 24.0) {
      return 3;
    } else {
      return 1; // Default to Medium
    }
  }

  double _getSizeFromText(String sizeText) {
    switch (sizeText) {
      case "Small":
        return 12.0;
      case "Medium":
        return 16.0;
      case "Large":
        return 20.0;
      case "Huge":
        return 24.0;
      default:
        return 16.0;
    }
  }

  Widget _buildTextColorPicker() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.black), // Adjust the color as needed
            borderRadius: BorderRadius.circular(8.0),
          ),
        )),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shadowColor: Colors.blueGrey,
                title: Text('Select Text Color'),
                content: SingleChildScrollView(
                  child: MaterialColorPicker(
                    onMainColorChange: (color) {
                      setState(() {
                        _selectedTextColor = color;
                      });
                      Navigator.of(context).pop();
                    },
                    selectedColor: _selectedTextColor,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.format_color_fill_outlined),
      ),
    );
  }
}