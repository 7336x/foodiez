import 'package:flutter/material.dart';
import 'package:foodiez/providers/RecipeProvider.dart';
import 'package:provider/provider.dart';


class MyRecipesPage extends StatelessWidget {
  const MyRecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes = Provider.of<RecipeProvider>(context).recipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Recipes"),
        centerTitle: true,
      ),
      body: recipes.isEmpty
          ? const Center(child: Text("No recipes saved yet!"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(recipe['recipeName'] ?? 'Unnamed Recipe'),
                    subtitle: Text(recipe['description'] ?? 'No description provided'),
                  ),
                );
              },
            ),
    );
  }
}
