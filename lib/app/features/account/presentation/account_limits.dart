import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/application/account_service.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_information.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';

class AccountLimitsContainer extends ConsumerWidget {
  const AccountLimitsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final UserService userService = ref.watch(userServiceProvider);
    final AccountService accountService = ref.read(
      accountServiceProvider.notifier,
    );
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
          return StreamBuilder(
            stream: accountService.getAccountsStream(user!.uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: PomboColors.pomboBlue,
                  ),
                );
              }
              final List<Map<String, dynamic>> accounts = snapshot.data!;
              final Map<String, dynamic> arsAccount = accounts.firstWhere(
                (account) => account['currency'] == 'ARS',
              );
              final Map<String, dynamic> usdAccount = accounts.firstWhere(
                (account) => account['currency'] == 'USD',
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PomboText().pomboLgText(
                        text: 'Limites de transferencia en Pesos',
                        isBold: true,
                      ),
                      PomboWhiteSpaces.hSpaceM,
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
                              prepend: 'Limite mensual',
                              append:
                                  'ARS \$${arsAccount['monthLimit'] ?? '2.000.000'}',
                            ),
                            AccountInformation(
                              prepend: 'Limite anual',
                              append:
                                  "ARS \$${arsAccount['yearLimit'] ?? '22.000.000'}",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PomboWhiteSpaces.hSpaceXL,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PomboText().pomboLgText(
                        text: 'Limites de trasnferencia en Dolares',
                        isBold: true,
                      ),
                      PomboWhiteSpaces.hSpaceM,
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
                              prepend: 'Limite mensual',
                              append:
                                  "USD \$${usdAccount['monthLimit'] ?? '10.000,00'}",
                            ),
                            AccountInformation(
                              prepend: 'Limite anual',
                              append:
                                  "USD \$${usdAccount['yearLimit'] ?? '120.000,00'}",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
