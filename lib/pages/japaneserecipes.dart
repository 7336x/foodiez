import 'package:flutter/material.dart';
import 'package:foodiez/pages/recipepage.dart';

class JapaneseRecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> japaneseRecipes = [
    {
      'name': 'Ramen',
      'image': 'images/Ramen.webp',
      'description': 'A Japanese noodle soup dish with a savory broth.',
      'ingredients': ['Noodles', 'Egg', 'Broth', 'Pork', 'Green Onions'],
      'steps': [
        'Boil the noodles until tender.',
        'Prepare the broth with soy sauce and miso paste.',
        'Add toppings like egg, pork, and green onions.',
        'Serve hot in a bowl with broth.'
      ],
    },
    {
      'name': 'Sushi',
      'image': 'images/salmonsushi.jpg',
      'description': 'A Japanese dish made with vinegared rice and fresh seafood.',
      'ingredients': ['Rice', 'Seaweed', 'Salmon', 'Soy Sauce', 'Wasabi'],
      'steps': [
        'Cook the rice with vinegar for flavor.',
        'Place a slice of fish or seafood on top.',
        'Wrap with seaweed if needed.',
        'Serve with soy sauce and wasabi.'
      ],
    },
    {
      'name': 'Tempura',
      'image': 'images/tempura.jpg',
      'description': 'Battered and deep-fried seafood or vegetables.',
      'ingredients': ['Shrimp', 'Vegetables', 'Flour', 'Eggs', 'Oil'],
      'steps': [
        'Prepare the batter with flour and eggs.',
        'Dip seafood or vegetables into the batter.',
        'Deep fry until crispy and golden.',
        'Serve with dipping sauce.'
      ],
    },
    {
      'name': 'Takoyaki',
      'image': 'images/Takoyakii.jpg',
      'description': 'A Japanese street food made of batter and octopus.',
      'ingredients': ['Flour', 'Eggs', 'Octopus', 'Bonito Flakes', 'Takoyaki Sauce'],
      'steps': [
        'Prepare the batter with flour and eggs.',
        'Fill the Takoyaki pan with batter and octopus pieces.',
        'Cook until crispy and round.',
        'Top with Takoyaki sauce and bonito flakes.'
      ],
    },
    {
      'name': 'Miso Soup',
      'image': 'images/misosoup.jpg',
      'description': 'A traditional Japanese soup with miso paste and tofu.',
      'ingredients': ['Miso Paste', 'Tofu', 'Seaweed', 'Green Onions', 'Broth'],
      'steps': [
        'Prepare the broth and add miso paste.',
        'Add diced tofu and seaweed.',
        'Simmer gently and add green onions.',
        'Serve hot in a bowl.'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Japanese Recipes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: japaneseRecipes.length,
          itemBuilder: (context, index) {
            final recipe = japaneseRecipes[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(
                      name: recipe['name']!,
                      image: recipe['image']!,
                      description: recipe['description']!,
                      ingredients: List<String>.from(recipe['ingredients']),
                      steps: List<String>.from(recipe['steps']),
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  height: 200, // height for cards
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Recipe image
                      ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                        ),
                        child: recipe['image']!.isNotEmpty
                            ? Image.asset(
                                recipe['image']!,
                                width: 180, // width for image
                                height: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 100,
                                color: Colors.grey[300],
                                child: Icon(Icons.image, size: 40),
                              ),
                      ),
                      // Recipe text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Click to learn more",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
