import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/states/recipe_provider.dart';
import 'screens/search_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeProvider()..loadRecipes(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      home: const SearchPage(),
    );
  }
}