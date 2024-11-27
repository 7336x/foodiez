import 'package:flutter/material.dart';
import 'package:foodiez/pages/recipepage.dart';

class ChineseRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chineseRecipes = [
      {
        'name': 'Sweet and Sour Chicken',
        'image': 'assets/images/chinessfood.webp',
        'description': 'A delicious Chinese dish with sweet and tangy flavors.',
        'ingredients': ['Chicken', 'Bell Peppers', 'Pineapple', 'Soy Sauce'],
        'steps': [
          'Cut the chicken into bite-sized pieces.',
          'Cook the chicken in a skillet until golden brown.',
          'Prepare the sauce with soy sauce, vinegar, and sugar.',
          'Mix the chicken with the sauce and serve hot.'
        ],
      },
      {
        'name': 'Kung Pao Chicken',
        'image': 'images/KungPaoChicken.jpeg',
        'description': 'A spicy Chinese stir-fry with peanuts and chili peppers.',
        'ingredients': ['Chicken', 'Peanuts', 'Chili', 'Soy Sauce'],
        'steps': [
          'Cut the chicken into cubes.',
          'Stir-fry peanuts and chili peppers in oil.',
          'Add the chicken and cook until tender.',
          'Serve with steamed rice.'
        ],
      },
      {
        'name': 'Spring Rolls',
        'image': 'images/SpringRolls.jpg',
        'description': 'Crispy and savory rolls filled with vegetables and meat.',
        'ingredients': ['Spring Roll Wrappers', 'Vegetables', 'Meat', 'Soy Sauce'],
        'steps': [
          'Prepare the filling by stir-frying vegetables and meat.',
          'Roll the filling in spring roll wrappers.',
          'Deep fry until golden brown.',
          'Serve with dipping sauce.'
        ],
      },
      {
        'name': 'Fried Rice',
        'image': 'images/FriedRice.jpg',
        'description': 'A savory dish made with rice and vegetables.',
        'ingredients': ['Rice', 'Vegetables', 'Soy Sauce', 'Eggs'],
        'steps': [
          'Cook the rice and set it aside.',
          'Stir-fry vegetables and eggs in a wok.',
          'Add the rice and soy sauce, then mix well.',
          'Serve hot.'
        ],
      },
      {
        'name': 'Hot and Sour Soup',
        'image': 'images/HotSourSoup.jpg',
        'description': 'A flavorful soup with a perfect balance of heat and tang.',
        'ingredients': ['Chicken Stock', 'Tofu', 'Mushrooms', 'Vinegar', 'Chili Sauce'],
        'steps': [
          'Boil the chicken stock and add tofu and mushrooms.',
          'Add vinegar and chili sauce for flavor.',
          'Simmer for 10 minutes and serve hot.',
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chinese Recipes',
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
          itemCount: chineseRecipes.length,
          itemBuilder: (context, index) {
            final recipe = chineseRecipes[index];
            return InkWell(
              onTap: () {
                // Navigate to RecipePage with recipe details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(
                      name: recipe['name'],
                      image: recipe['image'],
                      description: recipe['description'],
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
                      // Recipe Image
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
                                width: 180,
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
