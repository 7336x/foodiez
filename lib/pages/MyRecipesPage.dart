import 'package:flutter/material.dart';

class MyRecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> savedRecipes;

  const MyRecipesPage({
    Key? key,
    required this.savedRecipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Recipes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: savedRecipes.isEmpty
          ? const Center(
              child: Text(
                "No recipes saved yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: savedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = savedRecipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
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
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle recipe details if needed
                    },
                  ),
                );
              },
            ),
    );
  }
}
