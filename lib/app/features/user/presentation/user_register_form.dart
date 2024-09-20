import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
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
  final GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();

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
          if (context.mounted) {
            showErrorSnack(
              'Hubo un error al realizar la solicitud, verificá los datos o intentalo mas tarde',
              context,
            );
          }
        } else if (registerState.isSuccess) {
          registerService.clearControllers();
          if (context.mounted) {
            showSuccessSnack(
              'Registro exitoso',
              context,
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          showErrorSnack(
            'Hubo un error, revisá los datos e intentalo de nuevo',
            context,
          );
        }
      }
    }

    return PomboContainer(
      child: Form(
        key: formRegisterKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'pombo_logo_og.svg',
              width: 150,
              height: 150,
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
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: registerService.nameController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          label: PomboText().pomboSmText(
                            text: 'Nombre',
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresá un nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    PomboWhiteSpaces.wSpaceM,
                    Expanded(
                      child: TextFormField(
                        controller: registerService.lastNameController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          label: PomboText().pomboSmText(
                            text: 'Apellido',
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresá un nombre';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                TextFormField(
                  controller: registerService.phoneController,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    label: PomboText().pomboSmText(
                      text: 'Teléfono',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresá un teléfono';
                    } else if (!RegExp(r'^\+?\d{7,15}$').hasMatch(value)) {
                      return 'Ingresa un número de teléfono válido';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: registerService.streetAdressController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          label: PomboText().pomboSmText(
                            text: 'Calle',
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresá una calle';
                          }
                          return null;
                        },
                      ),
                    ),
                    PomboWhiteSpaces.wSpaceM,
                    Expanded(
                      child: TextFormField(
                        controller:
                            registerService.streetNumberAdressController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          label: PomboText().pomboSmText(
                            text: 'Numero',
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresá un número';
                          }
                          return null;
                        },
                      ),
                    ),
                    PomboWhiteSpaces.wSpaceM,
                    Expanded(
                      child: TextFormField(
                        controller: registerService.cityAdressController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          label: PomboText().pomboSmText(
                            text: 'Ciudad',
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresá una ciudad';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: registerService.emailController,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
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
                TextFormField(
                  obscureText: ref.watch(isObscure),
                  controller: registerService.passwordController,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    label: PomboText().pomboSmText(
                      text: 'Contraseña',
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ref.watch(isObscure)
                            ? PomboIcons.hide
                            : PomboIcons.show,
                        color: PomboColors.pomboBlue,
                      ),
                      onPressed: () {
                        ref.read(isObscure.notifier).state = false;
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresá una contraseña';
                    } else if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: registerService.rewritePasswordController,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    label: PomboText().pomboSmText(
                      text: 'Confirmar contraseña',
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresá una contraseña';
                    } else if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    } else if (registerService.passwordController.text !=
                        value) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
              ],
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
                  if (formRegisterKey.currentState!.validate()) {
                    handleRegister();
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
                          text: 'Crear cuenta',
                          color: PomboColors.pomboWhite,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final isLoading = StateProvider.autoDispose((ref) => false);
final isObscure = StateProvider.autoDispose((ref) => true);
final isAuthError = StateProvider((ref) => false);
