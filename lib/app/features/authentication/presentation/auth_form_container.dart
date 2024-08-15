import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/authentication/domain/user_state.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';

class AuthFormContainer extends ConsumerWidget {
  const AuthFormContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    // final AuthService authService = ref.read(authServiceProvider.notifier);
    // final UserState authState = ref.watch(authServiceProvider);

    // void showSnackbar() {
    //   final SnackBar snackbar = SnackBar(
    //     content: PomboText().pomboMdText(text: authState.errorMessage),
    //     backgroundColor: PomboColors.pomboRed,
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
    // }

    // void handleAuth() async {
    //   await authService.authWithCredentials();
    //   if (authState.user != null) {
    //     if (context.mounted) {
    //       context.goNamed(AppRoute.home.name);
    //     }
    //   } else if (authState.isError) {
    //     showSnackbar();
    //   }
    // }

    void fakeAuth() {
      ref.read(isLoading.notifier).state = true;
      Future.delayed(const Duration(seconds: 1), () {
        if (emailController.text == 'maxi' &&
            passwordController.text == 'maxi') {
          ref.read(isAuthError.notifier).state = false;

          ref.read(isLoading.notifier).state = false;
          context.goNamed(AppRoute.home.name);
        } else {
          ref.read(isLoading.notifier).state = false;
          ref.read(isAuthError.notifier).state = true;
        }
      });
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
                  text: 'Bienvenido a Pombo',
                  isBold: true,
                  isPrimary: false,
                ),
                PomboWhiteSpaces.hSpaceM,
                PomboText().pomboMdText(
                  text: 'Inicia sesión con tu correo y contraseña',
                  isPrimary: false,
                  color: PomboColors.pomboSecondaryText,
                ),
              ],
            ),
            PomboWhiteSpaces.hSpaceM,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      label: PomboText().pomboSmText(text: 'Email'),
                    ),
                  ),
                  PomboWhiteSpaces.hSpaceM,
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: PomboColors.pomboPrimaryText,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      label: PomboText().pomboSmText(text: 'Contraseña'),
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
                      // handleAuth();
                      fakeAuth();
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
                      onPressed: () {},
                      child: PomboText().pomboSmText(
                        text: 'Crear una',
                        color: PomboColors.pomboBlue,
                        isBold: true,
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
final isAuthError = StateProvider((ref) => false);
