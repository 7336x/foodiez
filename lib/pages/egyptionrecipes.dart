import 'package:flutter/material.dart';
import 'package:foodiez/pages/recipepage.dart';

class EgyptianRecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> egyptianRecipes = [
      {
        'name': 'Koshari',
        'image': 'assets/images/Egyptfood.webp',
        'description': 'A traditional Egyptian comfort food made with rice and lentils.',
        'ingredients': [
          'Rice',
          'Lentils',
          'Macaroni',
          'Tomato Sauce',
          'Crispy Onions'
        ],
        'steps': [
          'Cook the rice, lentils, and macaroni separately.',
          'Prepare a tomato sauce with garlic and spices.',
          'Layer the rice, lentils, and macaroni.',
          'Top with tomato sauce and crispy onions.',
          'Serve hot.'
        ],
      },
      {
        'name': 'Molokhia',
        'image': 'images/Molokhia.jpg',
        'description': 'A traditional Egyptian soup made with jute leaves.',
        'ingredients': ['Molokhia', 'Chicken Stock', 'Garlic', 'Coriander'],
        'steps': [
          'Chop the molokhia leaves finely.',
          'Cook the leaves in hot chicken stock.',
          'Fry garlic and coriander, then mix into the soup.',
          'Serve hot with rice or bread.'
        ],
      },
      {
        'name': 'Stuffed Pigeon',
        'image': 'images/stuffedpigeon.webp',
        'description': 'A delicacy of stuffed pigeon with rice or freekeh.',
        'ingredients': ['Pigeon', 'Rice or Freekeh', 'Spices'],
        'steps': [
          'Clean the pigeon thoroughly.',
          'Prepare the stuffing with rice or freekeh.',
          'Stuff the pigeon and sew it closed.',
          'Cook in boiling water until tender.',
          'Fry or roast before serving.'
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
        'name': 'Mahshi',
        'image': 'images/mahashi.webp',
        'description': 'Vegetables stuffed with rice and herbs.',
        'ingredients': ['Zucchini', 'Eggplant', 'Peppers', 'Rice', 'Herbs'],
        'steps': [
          'Prepare a mixture of rice, herbs, and spices.',
          'Hollow out the vegetables and stuff them.',
          'Cook in a pot with tomato sauce until tender.',
          'Serve warm.'
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Egyptian Recipes',
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
          itemCount: egyptianRecipes.length,
          itemBuilder: (context, index) {
            final recipe = egyptianRecipes[index];
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
