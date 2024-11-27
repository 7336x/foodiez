import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            color: const Color.fromARGB(255, 230, 226, 221),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'DishCraft',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Menu Items
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.pushNamed(context, '/home'); // Navigate to Home
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.login,
                  label: 'Sign In',
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.pushNamed(context, '/sign-in'); // Navigate to Sign In
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.app_registration,
                  label: 'Sign Up',
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.pushNamed(context, '/sign-up'); // Navigate to Sign Up
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.logout,
                  label: 'Sign Out',
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.pushNamed(context, '/sign-out'); // Navigate to Sign In after sign-out
                  },
                ),
              ],
            ),
          ),
       
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 219, 7, 7)),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      onTap: onTap,
    );
  }
}
