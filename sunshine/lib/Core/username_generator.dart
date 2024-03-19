import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';



String generateUsername() {
  final characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final length = 10; // Adjust length as needed

  String username = '';
  for (var i = 0; i < length; i++) {
    final randomIndex = Random().nextInt(characters.length);
    username += characters[randomIndex];
  }
  return username;
}



Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<void> setUsername(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
}