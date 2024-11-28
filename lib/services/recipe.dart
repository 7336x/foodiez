import 'package:dio/dio.dart';
import 'package:foodiez/models/ingredient.dart';
import 'package:foodiez/models/recipe.dart';
import 'package:foodiez/services/client.dart'; // Assuming client.dart has the Dio instance

class RecipesServices {
  // Fetch the list of all recipes
  static Future<List<Recipe>> list() async {
    try {
      var response = await dio.get('/recipe');
      var recipesJson = response.data['data']['recipes']
          as List; // Adjust based on API structure
      return recipesJson.map((recipe) => Recipe.fromJson(recipe)).toList();
    } catch (e) {
      print('Error fetching recipes: $e');
      return [];
    }
  }

  // Fetch recipes with better error handling
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    try {
      Response response = await dio.get('/recipe');
      var recipesJson = response.data['data']['recipes']
          as List; // Adjust API response structure if needed
      recipes = recipesJson.map((recipe) => Recipe.fromJson(recipe)).toList();
    } on DioError catch (error) {
      print(
          'Failed to fetch recipes: ${error.response?.data ?? error.message}');
    }
    return recipes;
  }

  // Create a new recipe
  Future<Recipe> createRecipe(
    String name,
    List<Ingredient> ingredients,
    String instructions,
    String madeBy,
    String category,
  ) async {
    try {
      // Convert ingredients to JSON if necessary
      var ingredientsJson =
          ingredients.map((ingredient) => ingredient.toJson()).toList();

      // Send POST request to create a recipe
      var response = await dio.post('/recipe', data: {
        "name": name,
        "instructions": instructions,
        "ingredients": ingredientsJson,
        "madeBy": madeBy,
        "category": category,
      });

      // Parse response and return the recipe object
      return Recipe.fromJson(response.data['data']);
    } on DioError catch (error) {
      print('Error creating recipe: ${error.response?.data ?? error.message}');
      rethrow; // Optional: rethrow to handle the error further up
    }
  }
}
