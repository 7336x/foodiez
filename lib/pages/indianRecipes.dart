import 'package:flutter/material.dart';
import 'package:foodiez/pages/recipepage.dart';

class IndianRecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> indianRecipes = [
    {
      'name': 'Butter Chicken',
      'image': 'images/butterchicken.jpeg',
      'description': 'A creamy and spiced Indian curry with chicken.',
      'ingredients': ['Chicken', 'Tomatoes', 'Cream', 'Butter', 'Spices'],
      'steps': [
        'Marinate chicken with spices and yogurt.',
        'Cook the chicken until tender.',
        'Prepare the creamy tomato-based curry.',
        'Combine chicken and curry, and simmer.',
        'Serve with naan or rice.'
      ],
    },
    {
      'name': 'Tandoori Chicken',
      'image': 'images/tandorechicken.webp',
      'description': 'An Indian dish marinated with yogurt and spices, roasted.',
      'ingredients': ['Chicken', 'Yogurt', 'Spices', 'Lemon Juice'],
      'steps': [
        'Marinate chicken with yogurt, spices, and lemon juice.',
        'Let it rest for a few hours.',
        'Roast the chicken in a tandoor or oven.',
        'Serve with mint chutney and naan.'
      ],
    },
    {
      'name': 'Paneer Tikka Masala',
      'image': 'images/paneertikkamasala.jpg',
      'description': 'A vegetarian curry with grilled paneer and spicy gravy.',
      'ingredients': ['Paneer', 'Tomatoes', 'Onions', 'Cream', 'Spices'],
      'steps': [
        'Marinate paneer with yogurt and spices.',
        'Grill the paneer until golden.',
        'Prepare the spicy tomato gravy.',
        'Add grilled paneer to the gravy and simmer.',
        'Serve with paratha or rice.'
      ],
    },
    {
      'name': 'Biryani',
      'image': 'images/biryani.jpg',
      'description': 'A fragrant rice dish cooked with spices and meat or vegetables.',
      'ingredients': [
        'Basmati Rice',
        'Chicken or Vegetables',
        'Spices',
        'Onions',
        'Saffron'
      ],
      'steps': [
        'Cook rice with saffron for fragrance.',
        'Prepare the spiced meat or vegetable base.',
        'Layer rice and meat, and cook together.',
        'Serve with raita and salad.'
      ],
    },
    {
      'name': 'Dal Makhani',
      'image': 'images/DalMakhani.jpg',
      'description': 'A rich and creamy lentil dish from North India.',
      'ingredients': ['Black Lentils', 'Tomatoes', 'Cream', 'Butter', 'Spices'],
      'steps': [
        'Soak lentils overnight and cook until soft.',
        'Prepare the tomato-based curry.',
        'Add cooked lentils and simmer with cream and butter.',
        'Serve with naan or rice.'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Indian Recipes',
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
          itemCount: indianRecipes.length,
          itemBuilder: (context, index) {
            final recipe = indianRecipes[index];
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
