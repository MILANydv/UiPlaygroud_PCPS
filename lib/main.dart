import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const ShopUiApp());
}

class ShopUiApp extends StatelessWidget {
  const ShopUiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
