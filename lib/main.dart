import 'package:flutter/material.dart';
import 'package:foodiez/pages/homepage.dart';
import 'package:foodiez/pages/sign_in_page.dart';
import 'package:foodiez/pages/sign_up_page.dart';
import 'package:foodiez/providers/RecipeProvider.dart';
import 'package:foodiez/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<RecipeProvider>(create: (_) => RecipeProvider()),
      ],
      child: const FoodiezApp(),
    ),
  );
}

class FoodiezApp extends StatelessWidget {
  const FoodiezApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DishCraft',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/sign-in': (context) => SignInScreen(),
        '/sign-up': (context) => SignUpScreen(),
      },
    );
  }
}
