import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_information.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';

class AccountInformationContainer extends ConsumerWidget {
  const AccountInformationContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PomboText().pomboLgText(
                text: 'Tu información',
                isBold: true,
              ),
              PomboWhiteSpaces.hSpaceL,
              Container(
                decoration: const BoxDecoration(
                  color: PomboColors.pomboBackground, 
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: const Column(
                  children: [
                    AccountInformation(
                      prepend: 'Nombre',
                      append: 'John',
                    ),
                    AccountInformation(
                      prepend: 'Apellido',
                      append: 'Doe',
                    ),
                    AccountInformation(
                      prepend: 'Email',
                      append: 'johndoe@pombomail.com.ar',
                    ),
                  ],
                ),
              ),
            ],
          ),
          // PomboWhiteSpaces.hSpaceL,
          // PomboWhiteSpaces.hSpaceL,
          // Container(
          //   alignment: Alignment.center,
          //   child: TextButton(
          //     child: PomboText().pomboLgText(
          //       text: 'Eliminar cuenta',
          //       color: PomboColors.pomboRed,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
