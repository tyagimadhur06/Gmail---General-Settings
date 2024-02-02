import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:gmail_assignment/Screens/Homescreen/home_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
        title:'Assignment',
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration:  Duration(milliseconds: 450),
        home:  HomeScreen(), 
    );
  }
}
