import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/features/user/domain/user_state.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';

class AuthFormContainer extends ConsumerWidget {
  const AuthFormContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService authService = ref.read(authServiceProvider.notifier);
    final UserState authState = ref.watch(authServiceProvider);

    void showSnackbar() {
      final SnackBar snackbar = SnackBar(
        content: PomboText().pomboMdText(text: authState.errorMessage),
        backgroundColor: PomboColors.pomboRed,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    void handleAuth() async {
      ref.read(isLoading.notifier).state = true;
      try {
        await authService.authWithCredentials();
        if (authState.user != null) {
          ref.read(isAuthError.notifier).state = false;
          ref.read(isLoading.notifier).state = false;
        } else if (authState.isError) {
          ref.read(isLoading.notifier).state = false;
          showSnackbar();
        }
      } catch (e) {
        final SnackBar snackbar = SnackBar(
          content: PomboText().pomboMdText(text: authState.errorMessage),
          backgroundColor: PomboColors.pomboRed,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }
    }

    return Expanded(
      child: PomboContainer(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PomboText().pomboXLText(
                  text: 'Bienvenido a POMBO',
                  isBold: true,
                  isPrimary: false,
                  isSpaced: true,
                ),
                PomboWhiteSpaces.hSpaceM,
                PomboText().pomboMdText(
                  text: 'Inicia sesión con tu correo y contraseña',
                  color: PomboColors.pomboSecondaryText,
                ),
              ],
            ),
            PomboWhiteSpaces.hSpaceM,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: authService.emailController,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      label: PomboText().pomboSmText(
                        text: 'Email',
                      ),
                    ),
                  ),
                  PomboWhiteSpaces.hSpaceM,
                  TextFormField(
                    obscureText: true,
                    controller: authService.passwordController,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: PomboColors.pomboBlue,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      label: PomboText().pomboSmText(
                        text: 'Contraseña',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PomboWhiteSpaces.hSpaceM,
            Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: PomboText().pomboSmText(
                      text: '¿Olvidaste tu contraseña?',
                      color: PomboColors.pomboBlue,
                    ),
                  ),
                ),
                PomboWhiteSpaces.hSpaceM,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        PomboColors.pomboBlue,
                      ),
                    ),
                    onPressed: () {
                      handleAuth();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ref.watch(isLoading)
                          ? const CircularProgressIndicator(
                              color: PomboColors.pomboWhite,
                            )
                          : PomboText().pomboSmText(
                              text: 'Ingresar',
                              color: PomboColors.pomboWhite,
                            ),
                    ),
                  ),
                ),
                PomboWhiteSpaces.hSpaceM,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PomboText().pomboSmText(
                      text: '¿No tenes cuenta?',
                    ),
                    TextButton(
                      onPressed: () {
                        context.goNamed(AppRoute.register.name);
                      },
                      child: PomboText().pomboSmText(
                        text: 'Crear una',
                        color: PomboColors.pomboBlue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final isLoading = StateProvider((ref) => false);
final isObscure = StateProvider((ref) => true);
final isAuthError = StateProvider((ref) => false);
