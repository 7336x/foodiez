import 'package:foodiez/models/ingredient.dart';

class Recipe {
  String id;
  String name;
  String category;
  List<Ingredient> ingredients;
  String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.ingredients,
    required this.instructions,
  });

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        category = json['category'] as String,
        ingredients = (json['ingredients'] as List)
            .map((item) => Ingredient.fromJson(item as Map<String, dynamic>))
            .toList(),
        instructions = json['instructions'] as String;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'ingredients':
          ingredients.map((ingredient) => ingredient.toJson()).toList(),
      'instructions': instructions,
    };
  }
}
