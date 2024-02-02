import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gmail_assignment/Screens/Settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blueGrey.withOpacity(0.1),
            prefixIcon: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Get.to(() => SettingsScreen());
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    foregroundImage:
                        AssetImage('assets/images/profile_image.jpg'),
                    radius: 20.0,
                  ),
                ),
              ],
            ),
            hintText: "Search in mail",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none),
          ),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
