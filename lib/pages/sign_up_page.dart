import 'package:foodiez/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DishCraft",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              'images/logo.png',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 4, 4, 4),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.red),
              ),
              controller: usernameController,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.red),
              ),
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                try {
                  await context.read<AuthProvider>().signup(
                        username: usernameController.text,
                        password: passwordController.text,
                      );

                  var user = context.read<AuthProvider>().user;
                  print("You are signed up as ${user!.username}");
                } on DioException catch (e) {
                  if (e.response == null) return;
                  if (e.response!.data == null) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          e.response!.data['message'] ?? "Unexpected error"),
                    ),
                  );
                }
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            context.read<AuthProvider>().user?.username ?? "Not Logged in",
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
