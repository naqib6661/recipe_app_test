import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/recipe_provider.dart';
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
<<<<<<< HEAD
=======
      debugShowCheckedModeBanner: false,

>>>>>>> 6ade1f8 (Added search box with live search and  load data from api)
      home:  SearchPage(),
    );
  }
}
