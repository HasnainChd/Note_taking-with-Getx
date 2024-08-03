import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 25),
            color: Colors.deepPurple,
            centerTitle: true,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white)),
      home:  HomePage(),
    );
  }
}
