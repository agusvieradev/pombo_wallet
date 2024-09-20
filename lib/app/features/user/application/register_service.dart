import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/data/account_repository.dart';
import 'package:pombo_wallet/app/features/user/domain/register_state.dart';
import 'package:pombo_wallet/app/features/user/data/resgister_repository.dart';

class UserRegisterService extends StateNotifier<RegisterState> {
  UserRegisterService({
    required this.registerRepository,
    required this.accountRepository,
  }) : super(RegisterState());

  final UserRegisterRepository registerRepository;
  final AccountRepository accountRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rewritePasswordController =
      TextEditingController();
  final TextEditingController streetAdressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetNumberAdressController =
      TextEditingController();
  final TextEditingController ciController = TextEditingController();
  final TextEditingController cityAdressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> registerAndSaveUser() async {
    try {
      state = RegisterState(isLoading: true);
      final User? user = await registerRepository.registerUser(
        emailController.text,
        passwordController.text,
      );
      if (user != null) {
        try {
          await registerRepository.saveUserData(
            userId: user.uid,
            name: nameController.text,
            lastName: lastNameController.text,
            adress:
                '${streetAdressController.text} ${streetNumberAdressController.text}, ${cityAdressController.text}',
            phone: phoneController.text,
            email: emailController.text,
          );
          await accountRepository.createAccounts(user.uid);
          state = RegisterState(isLoading: false, isSuccess: true);
          log('Usuario creado exitosamente');
        } catch (e, stk) {
          log('Error: $e. Trace: $stk');
          throw Exception('Error: $e. Trace: $stk');
        }
      } else {
        state = RegisterState(
          isLoading: false,
          isError: true,
          errorMessage: 'Error al generar usuario, reintentar por favor.',
        );
        log('No se pudo registrrar el usuario. Error: $user');
        throw Exception('No se pudo registrrar el usuario. Error: $user');
      }
    } catch (e, stk) {
      state = RegisterState(
        isLoading: false,
        isError: true,
        errorMessage: 'Error al generar usuario, reintentar por favor. $e',
      );
      log('Error: $e. Trace: $stk');
      throw Exception('Error: $e. Trace: $stk');
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    streetAdressController.clear();
    nameController.clear();
    streetNumberAdressController.clear();
    ciController.clear();
    cityAdressController.clear();
    phoneController.clear();
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
    streetAdressController.dispose();
    nameController.dispose();
    streetNumberAdressController.dispose();
    ciController.dispose();
    cityAdressController.dispose();
    phoneController.dispose();
  }
}

final StateNotifierProvider<UserRegisterService, RegisterState>
    userRegisterServiceProvider =
    StateNotifierProvider<UserRegisterService, RegisterState>(
  (ref) {
    final UserRegisterRepository registerRepository = ref.watch(
      userRegisterRepositoryProvider,
    );
    final AccountRepository accountRepository = ref.watch(
      accountRepositoryProvider,
    );
    return UserRegisterService(
      registerRepository: registerRepository,
      accountRepository: accountRepository,
    );
  },
);
