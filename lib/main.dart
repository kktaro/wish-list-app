import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app/presentation/pages/home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: WishListApp(),
    ),
  );
}

class WishListApp extends StatelessWidget {
  const WishListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '買いたいものリスト',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
