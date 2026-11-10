import 'package:flutter/material.dart';
import 'pablo_shopping_cart_page.dart';

void main() {
  runApp(const MyApp());
}

/// Root application widget implemented as a [StatelessWidget].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Store Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E60E2),
          primary: const Color(0xFF1E60E2),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
      ),
      home: const ShoppingCartPage(),
    );
  }
}
