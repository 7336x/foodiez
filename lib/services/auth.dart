import 'dart:math';

import 'package:foodiez/models/user.dart';
import 'package:foodiez/services/client.dart';

/// Calls API `/signup` by sending email and password in body
Future<User> signupAPI(String username, String password) async {
  // send request to API and store response
  var response = await dio.post("/auth/signup", data: {
    "username": username,
    "password": password,
  });

  // parse response from Map into User object and return it
  if (response.data != null && response.data['data'] != null) {
    return User.fromJson(response.data['data']);
  } else {
    throw Exception('Failed to load user data');
  }
}

Future<User> signInAPI(String username, String password) async {
  // Send request to API and store the response
  var response = await dio.post("/auth/signin", data: {
    "username": username,
    "password": password,
  });

  // Parse response from Map into User object and return it
  print(response.data);
  return User.fromJson(response.data['data']);
}
