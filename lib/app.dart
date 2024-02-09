import 'package:flutter/material.dart';
import 'package:to_application_with_rest_api_implementation/product_list_screen.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProductListScreen(),
    );
  }
}
