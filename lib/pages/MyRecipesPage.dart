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
        title: const Text(
          "My Recipes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: recipes.isEmpty
          ? const Center(
              child: Text(
                "No recipes saved yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      recipe['recipeName'] ?? 'Unnamed Recipe',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      recipe['description'] ?? 'No description provided',
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ingredients:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            ...List<Widget>.generate(
                              (recipe['ingredients'] as List).length,
                              (i) => Text("- ${recipe['ingredients'][i]}"),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Steps:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(recipe['steps'] ?? 'No steps provided'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
