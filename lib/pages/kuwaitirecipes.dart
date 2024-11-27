import 'package:flutter/material.dart';
import 'package:foodiez/pages/recipepage.dart';

class KuwaitiRecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> kuwaitiRecipes = [
    {
      'name': 'Machboos',
      'image': 'assets/images/kuwaitifood.jpeg',
      'description': 'A flavorful Kuwaiti rice dish with spiced chicken or lamb.',
      'ingredients': ['Rice', 'Chicken', 'Spices', 'Onions', 'Tomatoes'],
      'steps': [
        'Cook the rice with spices until fluffy.',
        'Prepare the chicken by marinating it with spices.',
        'Roast or fry the chicken until golden brown.',
        'Combine the rice and chicken before serving.',
        'Garnish with fried onions and nuts.'
      ],
    },
    {
      'name': 'Harees',
      'image': 'images/harres.jpeg',
      'description': 'A traditional Arabian dish made with wheat and meat.',
      'ingredients': ['Wheat', 'Meat', 'Salt', 'Butter'],
      'steps': [
        'Soak wheat overnight.',
        'Cook the wheat and meat together until soft.',
        'Mash the mixture to a smooth consistency.',
        'Add butter and serve warm.'
      ],
    },
    {
      'name': 'Fattah',
      'image': 'images/fattah.jpg',
      'description': 'A Middle Eastern dish made with rice, meat, and bread.',
      'ingredients': [
        'Rice',
        'Bread',
        'Lamb or Beef',
        'Garlic',
        'Vinegar',
        'Tomato Sauce'
      ],
      'steps': [
        'Cook the rice and set it aside.',
        'Fry bread cubes until crispy.',
        'Cook the meat with garlic and vinegar.',
        'Layer bread, rice, and meat, and top with tomato sauce.',
        'Serve immediately.'
      ],
    },
    {
      'name': 'Matabg Zbaide',
      'image': '/images/matabgzbaide.jpg',
      'description': 'A traditional Kuwaiti fish dish served with rice.',
      'ingredients': ['Fish', 'Rice', 'Spices', 'Tomatoes', 'Onions'],
      'steps': [
        'Marinate the fish with spices and fry until crispy.',
        'Cook the rice with aromatic spices.',
        'Serve the fish on top of the rice.',
        'Garnish with tomatoes and onions.'
      ],
    },
    {
      'name': 'Luqaimat',
      'image': 'images/luqaimat.jpg',
      'description': 'Sweet dumplings drizzled with date syrup.',
      'ingredients': ['Flour', 'Yeast', 'Sugar', 'Water', 'Date Syrup'],
      'steps': [
        'Prepare the dough and let it rise.',
        'Shape the dough into small balls.',
        'Deep fry the balls until golden brown.',
        'Drizzle with date syrup and serve warm.'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kuwaiti Recipes',
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
          itemCount: kuwaitiRecipes.length,
          itemBuilder: (context, index) {
            final recipe = kuwaitiRecipes[index];
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
