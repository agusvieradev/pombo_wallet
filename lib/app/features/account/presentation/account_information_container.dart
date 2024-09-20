import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_information.dart';
import 'package:pombo_wallet/app/features/user/application/user_service.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';

class AccountInformationContainer extends ConsumerWidget {
  const AccountInformationContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserService userService = ref.watch(userServiceProvider);
    // final AccountService accountService = ref.read(
    //   accountServiceProvider.notifier,
    // );
    return PomboContainer(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: PomboColors.pomboBlue,
              ),
            );
          }
          final User? user = snapshot.data;
          return StreamBuilder<Map<String, dynamic>>(
            stream: userService.getUserDataStream(user!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: PomboColors.pomboBlue,
                  ),
                );
              }
              final Map<String, dynamic> userData = snapshot.data!;
              return Column(
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
                            Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            AccountInformation(
                              prepend: 'Nombre',
                              append: userData['name'],
                            ),
                            AccountInformation(
                              prepend: 'Apellido',
                              append: userData['lastName'],
                            ),
                            AccountInformation(
                              prepend: 'Email',
                              append: userData['email'],
                            ),
                            AccountInformation(
                              prepend: 'Telefono',
                              append: userData['phone'],
                            ),
                            AccountInformation(
                              prepend: 'Dirección',
                              append: userData['adress'],
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
              );
            },
          );
        },
      ),
    );
  }
}
