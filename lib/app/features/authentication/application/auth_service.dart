import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pombo_wallet/app/features/user/domain/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pombo_wallet/app/features/user/domain/user_state.dart';
import 'package:pombo_wallet/app/features/authentication/data/auth_repository.dart';

class AuthService extends StateNotifier<UserState> {
  AuthService({required this.authRepository}) : super(UserState());
  final AuthRepository authRepository;

  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  Future<User?> authWithCredentials() async {
    try {
      state = UserState(isLoading: true);
      final UserCredential user = await authRepository.logIn(
        emailController.text,
        passwordController.text,
      );
      state = UserState(isLoading: false, user: user.user);
      return user.user;
    } catch (e) {
      state = UserState(isError: true, isLoading: false, errorMessage: '$e');
      throw Exception(e);
    }
  }

  Future<void> sendPasswordResetEmail(BuildContext context) async {
    try {
      await authRepository.firebaseAuth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future authWithGoogle() async {
    try {
      state = UserState(isLoading: true);
      await authRepository.logInWithGoogle();
      state = UserState(isLoading: false);
    } catch (e) {
      state = UserState(isError: true, isLoading: false, errorMessage: '$e');
      throw Exception(e);
    }
  }

  Future logOut() async {
    await authRepository.logOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }

  void setUserState(User? user) {
    state = UserState(user: user);
  }
}

final StateNotifierProvider<AuthService, UserState> authServiceProvider =
    StateNotifierProvider<AuthService, UserState>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return AuthService(authRepository: authRepository);
});
