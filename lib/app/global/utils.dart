import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserSession(User? user) async {
  final prefs = await SharedPreferences.getInstance();
  if (user != null) {
    await prefs.setBool('isLoggedIn', true);
  } else {
    await prefs.setBool('isLoggedIn', false);
  }
}
