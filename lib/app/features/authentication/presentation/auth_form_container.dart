import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pombo_wallet/app/global/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';

class AuthFormContainer extends ConsumerWidget {
  const AuthFormContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService authService = ref.read(authServiceProvider.notifier);

    void handleAuth() async {
      ref.read(isLoading.notifier).state = true;
      try {
        await authService.authWithCredentials();
        authService.clearControllers();
        ref.read(isLoading.notifier).state = false;
        if (context.mounted) {
          showSuccessSnack(
            'Bienvenida Pombo Waller',
            context,
          );
        }
      } catch (e) {
        if (context.mounted) {
          ref.read(isLoading.notifier).state = false;
          showErrorSnack(
            'Hubo un error al enviar el correo, revisá si escribiste bien tu email e intentalo de nuevo',
            context,
          );
        }
      }
    }

    void handlePassword() async {
      ref.read(isLoading.notifier).state = true;
      try {
        await authService.sendPasswordResetEmail(context);
        ref.read(isLoading.notifier).state = false;
        ref.read(forgotPassword.notifier).state = false;
        if (context.mounted) {
          showSuccessSnack(
            'Email enviado exitosamente, revisá tu email ${authService.emailController.text}',
            context,
          );
          authService.clearControllers();
        }
      } catch (e) {
        if (context.mounted) {
          ref.read(isLoading.notifier).state = false;
          showErrorSnack(
            'Hubo un error, revisá las credenciales e intentalo de nuevo',
            context,
          );
        }
      }
    }

    return Expanded(
      child: PomboContainer(
        child: !ref.watch(forgotPassword)
            ? Form(
                key: authService.authFormKey,
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
                    Column(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresá un email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Ingresa un email válido';
                            }
                            return null;
                          },
                        ),
                        PomboWhiteSpaces.hSpaceM,
                        TextFormField(
                          obscureText: ref.read(isObscure),
                          controller: authService.passwordController,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            color: PomboColors.pomboBlue,
                            fontSize: 22,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                ref.watch(isObscure)
                                    ? PomboIcons.hide
                                    : PomboIcons.show,
                                color: PomboColors.pomboBlue,
                              ),
                              onPressed: () {
                                ref.read(isObscure.notifier).state =
                                    !ref.read(isObscure.notifier).state;
                              },
                            ),
                            label: PomboText().pomboSmText(
                              text: 'Contraseña',
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa una contraseña';
                            } else if (value.length < 6) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              ref.read(forgotPassword.notifier).state = true;
                            },
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
                              if (authService.authFormKey.currentState!
                                  .validate()) {
                                handleAuth();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ref.watch(isLoading)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: PomboColors.pomboWhite,
                                      ),
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
              )
            : Form(
                key: authService.authFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PomboText().pomboXLText(
                              text: 'Recuperá tu contraseña',
                              isBold: true,
                              isPrimary: false,
                              isSpaced: true,
                            ),
                            IconButton(
                              onPressed: () {
                                ref.read(forgotPassword.notifier).state = false;
                              },
                              splashRadius: 1,
                              splashColor: PomboColors.pomboTrans,
                              icon: const Icon(
                                PomboIcons.close,
                                color: PomboColors.pomboBlue,
                              ),
                            ),
                          ],
                        ),
                        PomboWhiteSpaces.hSpaceM,
                        PomboText().pomboMdText(
                          text:
                              'Escribe tu Email para enviar un correo de recuperación',
                          color: PomboColors.pomboSecondaryText,
                        ),
                      ],
                    ),
                    PomboWhiteSpaces.hSpaceM,
                    Column(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresá un email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Ingresa un email válido';
                            }
                            return null;
                          },
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
                              if (authService.authFormKey.currentState!
                                  .validate()) {
                                handlePassword();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ref.watch(isLoading)
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: PomboColors.pomboWhite,
                                      ),
                                    )
                                  : PomboText().pomboSmText(
                                      text: 'Recuperar contraseña',
                                      color: PomboColors.pomboWhite,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

final AutoDisposeStateProvider<bool> isLoading = StateProvider.autoDispose(
  (ref) => false,
);
final AutoDisposeStateProvider<bool> isObscure = StateProvider.autoDispose(
  (ref) => true,
);
final AutoDisposeStateProvider<bool> forgotPassword = StateProvider.autoDispose(
  (ref) => false,
);
