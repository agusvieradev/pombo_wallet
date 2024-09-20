import 'package:firebase_auth/firebase_auth.dart';

class UserState {
  UserState({
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage = '',
    this.user,
  });
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String errorMessage;
  final User? user;
}
