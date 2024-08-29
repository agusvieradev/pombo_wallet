import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/user/domain/register_state.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/user/application/register_service.dart';

class UserRegisterForm extends ConsumerStatefulWidget {
  const UserRegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserRegisterFormState();
}

class _UserRegisterFormState extends ConsumerState<UserRegisterForm> {
  @override
  Widget build(BuildContext context) {
    final UserRegisterService registerService = ref.read(
      userRegisterServiceProvider.notifier,
    );
    final RegisterState registerState = ref.watch(userRegisterServiceProvider);

    void handleRegister() async {
      ref.read(isLoading.notifier).state = true;
      try {
        await registerService.registerAndSaveUser();
        if (registerState.isError) {
          final SnackBar snackbar = SnackBar(
            content: PomboText().pomboMdText(text: registerState.errorMessage),
            backgroundColor: PomboColors.pomboRed,
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        } else if (registerState.isSuccess) {
          final SnackBar snackbar = SnackBar(
            content: PomboText().pomboMdText(
              text: 'Usuario creado exitosamente',
            ),
            backgroundColor: PomboColors.pomboSuccess,
          );

          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            context.goNamed(AppRoute.login.name);
          }
        }
      } catch (e) {
        final SnackBar snackbar = SnackBar(
          content: PomboText().pomboMdText(text: registerState.errorMessage),
          backgroundColor: PomboColors.pomboRed,
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }
    }

    return Expanded(
      child: PomboContainer(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'pombo_logo_og.svg',
                width: 250,
                height: 250,
                colorFilter: const ColorFilter.mode(
                  PomboColors.pomboBlue,
                  BlendMode.srcIn,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PomboText().pomboXLText(
                    text: 'Registrate a POMBO',
                    isBold: true,
                    isPrimary: false,
                    isSpaced: true,
                  ),
                  PomboWhiteSpaces.hSpaceM,
                  PomboText().pomboMdText(
                    text: 'Ingresa tus datos y crea una cuenta',
                    color: PomboColors.pomboSecondaryText,
                  ),
                ],
              ),
              PomboWhiteSpaces.hSpaceM,
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: registerService.nameController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Nombre',
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: registerService.phoneController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                        label: PomboText().pomboSmText(
                          text: 'Teléfono',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: registerService.streetAdressController,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                              label: PomboText().pomboSmText(
                                text: 'Calle',
                              ),
                            ),
                          ),
                        ),
                        PomboWhiteSpaces.wSpaceM,
                        Expanded(
                          child: TextFormField(
                            controller:
                                registerService.streetNumberAdressController,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                              label: PomboText().pomboSmText(
                                text: 'Numero',
                              ),
                            ),
                          ),
                        ),
                        PomboWhiteSpaces.wSpaceM,
                        Expanded(
                          child: TextFormField(
                            controller: registerService.cityAdressController,
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                              label: PomboText().pomboSmText(
                                text: 'Ciudad',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: registerService.emailController,
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
                    TextFormField(
                      obscureText: true,
                      controller: registerService.passwordController,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
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
              PomboWhiteSpaces.hSpaceXL,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      PomboColors.pomboBlue,
                    ),
                  ),
                  onPressed: () {
                    handleRegister();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ref.watch(isLoading)
                        ? const CircularProgressIndicator(
                            color: PomboColors.pomboWhite,
                          )
                        : PomboText().pomboSmText(
                            text: 'Crear cuenta',
                            color: PomboColors.pomboWhite,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final isLoading = StateProvider((ref) => false);
final isObscure = StateProvider((ref) => true);
final isAuthError = StateProvider((ref) => false);
