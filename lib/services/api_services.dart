import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List recipes = data['recipes'];
      return recipes.map((e) => Recipe.fromJson(e)).toList();
    } else {
      throw Exception("Can not load recipes");
    }
  }
}