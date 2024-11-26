import 'package:flutter/material.dart';

class IndianRecipesPage extends StatelessWidget {
  final List<Map<String, String>> indianRecipes = [
    {
      'name': 'Butter Chicken',
      'image': 'images/butterchicken.jpeg',
    },
    {
      'name': 'Tandoori Chicken',
      'image': 'images/tandorechicken.webp',
    },
    {
      'name': 'Paneer Tikka Masala',
      'image': 'images/paneertikkamasala.jpg',
    },
    {
      'name': 'Biryani',
      'image': 'images/biryani.jpg',
    },
    {
      'name': 'Dal Makhani',
      'image': 'images/DalMakhani.jpg',
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
            return Padding(
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
                              width: 180, //  width for  image
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
            );
          },
        ),
      ),
    );
  }
}
