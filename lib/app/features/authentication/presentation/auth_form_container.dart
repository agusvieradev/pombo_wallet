import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';

class AuthFormContainer extends ConsumerWidget {
  const AuthFormContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: PomboText().pomboSmText(
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
