import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/authentication/domain/user_state.dart';
import 'package:pombo_wallet/app/features/authentication/data/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends StateNotifier<UserState> {
  AuthService({required this.authRepository}) : super(UserState());
  final AuthRepository authRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future authWithCredentials() async {
    try {
      state = UserState(isLoading: true);
      final UserCredential user = await authRepository.logIn(
        emailController.text,
        passwordController.text,
      );
      state = UserState(isLoading: false, user: user.user);
    } catch (e) {
      state = UserState(isError: true, isLoading: false, errorMessage: '$e');
    }
  }

  Future authWithGoogle() async {
    try {
      state = UserState(isLoading: true);
      final UserCredential? user = await authRepository.logInWithGoogle();
      state = UserState(isLoading: false, user: user!.user);
    } catch (e) {
      state = UserState(isError: true, isLoading: false, errorMessage: '$e');
    }
  }

  Future logOut() async {
    await authRepository.logOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
  }
}

final StateNotifierProvider<AuthService, UserState> authServiceProvider =
    StateNotifierProvider<AuthService, UserState>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return AuthService(authRepository: authRepository);
});
