import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/user/domain/register_state.dart';
import 'package:pombo_wallet/app/features/user/data/resgister_repository.dart';

class UserRegisterService extends StateNotifier<RegisterState> {
  UserRegisterService({required this.registerRepository})
      : super(RegisterState());
  final UserRegisterRepository registerRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController streetAdressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
            adress:
                '${streetAdressController.text} ${streetNumberAdressController.text}, ${cityAdressController.text}',
            phone: phoneController.text,
            email: emailController.text,
          );
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
}

final StateNotifierProvider<UserRegisterService, RegisterState>
    userRegisterServiceProvider =
    StateNotifierProvider<UserRegisterService, RegisterState>(
  (ref) {
    final UserRegisterRepository registerRepository =
        ref.watch(userRegisterRepositoryProvider);
    return UserRegisterService(registerRepository: registerRepository);
  },
);
