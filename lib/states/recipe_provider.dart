import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_services.dart';

class RecipeProvider extends ChangeNotifier {
  final ApiService _api = ApiService();
  List<Recipe> _allRecipes = [];
  List<Recipe> _filteredRecipes = [];

  List<Recipe> get recipes {
    return _filteredRecipes;
  }

  Future<void> loadRecipes() async {
    _allRecipes = await _api.fetchRecipes();
    _filteredRecipes = _allRecipes;
    notifyListeners();
  }

  void search(String query) {
    if (query.isEmpty) {
      _filteredRecipes = _allRecipes;
    } else {
      _filteredRecipes = _allRecipes
          .where((r) => r.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}