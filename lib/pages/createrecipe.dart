import 'package:flutter/material.dart';
import 'package:foodiez/providers/RecipeProvider.dart';
import 'package:provider/provider.dart';


class CreateRecipePage extends StatefulWidget {
  final List<String> ingredients;

  const CreateRecipePage({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController howToCookController = TextEditingController();
  final List<String?> selectedIngredients = List.filled(5, null);

  @override
  void dispose() {
    recipeNameController.dispose();
    descriptionController.dispose();
    howToCookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Recipe"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recipe Name"),
            TextField(
              controller: recipeNameController,
              decoration: const InputDecoration(hintText: "Enter the recipe name"),
            ),
            const SizedBox(height: 20),
            const Text("Description"),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Enter recipe description"),
            ),
            const SizedBox(height: 20),
            const Text("Ingredients"),
            for (int i = 0; i < 5; i++)
              DropdownButtonFormField<String>(
                value: selectedIngredients[i],
                items: widget.ingredients
                    .map((ingredient) => DropdownMenuItem<String>(
                          value: ingredient,
                          child: Text(ingredient),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedIngredients[i] = value;
                  });
                },
                decoration: const InputDecoration(hintText: "Choose your ingredient"),
              ),
            const SizedBox(height: 20),
            const Text("How to Cook"),
            TextField(
              controller: howToCookController,
              decoration: const InputDecoration(hintText: "Enter cooking steps"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newRecipe = {
                  'recipeName': recipeNameController.text,
                  'description': descriptionController.text,
                  'ingredients': selectedIngredients.whereType<String>().toList(),
                  'steps': howToCookController.text,
                };

                // Add recipe to provider
                Provider.of<RecipeProvider>(context, listen: false).addRecipe(newRecipe);

                Navigator.pop(context); // Go back after saving
              },
              child: const Text("Save Recipe"),
            ),
          ],
        ),
      ),
    );
  }
}
