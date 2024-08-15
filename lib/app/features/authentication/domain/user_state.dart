import 'package:firebase_auth/firebase_auth.dart';

class UserState {
  UserState({
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    this.user,
  });
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final User? user;
}
