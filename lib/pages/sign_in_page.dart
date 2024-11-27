import 'package:foodiez/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Sign In"),
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  // wait for authentication
                  await context.read<AuthProvider>().signIn(
                      email: usernameController.text,
                      password: passwordController.text);

                  var user = context.read<AuthProvider>().user;
                  print("You are logged in as ${user!.username}");
                } on DioException catch (e) {
                  if (e.response == null) return;
                  if (e.response!.data == null) return;

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          e.response!.data['message'] ?? "Unexpected error")));
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
