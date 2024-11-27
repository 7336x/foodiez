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
        title: const Text(
          "Create Recipe",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Name Field
            const Text(
              "Recipe Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: recipeNameController,
              decoration: InputDecoration(
                hintText: "Enter the recipe name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description Field
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter recipe description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Ingredients Dropdowns
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < 5; i++) ...[
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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  hintText: "Choose your ingredient",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 10),
            ],

            // How to Cook Field
            const Text(
              "How to Cook",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: howToCookController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Enter cooking steps",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Save Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey, // Gray background
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  final newRecipe = {
                    'recipeName': recipeNameController.text,
                    'description': descriptionController.text,
                    'ingredients':
                        selectedIngredients.whereType<String>().toList(),
                    'steps': howToCookController.text,
                  };

                  // Add recipe to provider
                  Provider.of<RecipeProvider>(context, listen: false)
                      .addRecipe(newRecipe);

                  Navigator.pop(context); // Go back after saving
                },
                child: const Text(
                  "Save Recipe",
                  style: TextStyle(
                    fontSize: 18, // Larger font size for the button
                    color: Colors.white, // White font
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
