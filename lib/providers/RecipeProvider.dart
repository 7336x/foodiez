import 'package:flutter/material.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _recipes = [];

  List<Map<String, dynamic>> get recipes => List.unmodifiable(_recipes);

  void addRecipe(Map<String, dynamic> recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}
