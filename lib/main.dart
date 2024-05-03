import 'package:flutter/material.dart';
import 'package:weatherwize_app/theme/dark_theme.dart';
import 'package:weatherwize_app/theme/light_theme.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
