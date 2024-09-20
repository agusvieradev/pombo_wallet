// ignore_for_file: dead_code, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/application/account_service.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance.dart';
import 'package:pombo_wallet/app/features/user/application/user_service.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_primary_button.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/transaction_currency_modal.dart';

class BalanceContainer extends ConsumerWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserService userService = ref.watch(userServiceProvider);
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
              print('ID ${user.uid}');

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PomboText().pomboMdText(
                        text: 'Hola, ${userData['name']}',
                        isPrimary: false,
                        isBold: true,
                        color: PomboColors.pomboBlue,
                      ),
                      PomboWhiteSpaces.hSpaceL,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PomboText().pomboLgText(
                            text: 'Tus cuentas',
                            isBold: true,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              PomboIcons.refresh,
                              color: PomboColors.pomboBlue,
                            ),
                          )
                        ],
                      ),
                      PomboWhiteSpaces.hSpaceM,
                      StreamBuilder(
                        stream: accountService.getAccountsStream(user.uid),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: PomboColors.pomboBlue,
                              ),
                            );
                          }

                          if (!snapshot.hasData) {
                            return Center(
                              child: PomboText()
                                  .pomboLgText(text: 'Hubo un error'),
                            );
                          }
                          print('ID ${user.uid}');
                          final List<Map<String, dynamic>> accounts =
                              snapshot.data!;
                          print('accounts $accounts');
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 0; i < accounts.length; i++)
                                Balance(account: accounts[i]),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  PomboWhiteSpaces.hSpaceXL,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PomboPrimaryButton(
                        buttonText: 'Ingresar',
                        buttonIcon: PomboIcons.deposit,
                        buttonAction: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const TransactionCurrencyModal(
                                transactionType: 'deposit',
                              );
                            },
                          );
                        },
                      ),
                      PomboWhiteSpaces.wSpaceL,
                      PomboPrimaryButton(
                        buttonText: 'Cobrar',
                        buttonIcon: PomboIcons.payment,
                        buttonAction: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const TransactionCurrencyModal(
                                transactionType: 'payment',
                              );
                            },
                          );
                        },
                      ),
                      PomboWhiteSpaces.wSpaceL,
                      PomboPrimaryButton(
                        buttonText: 'Retirar',
                        buttonIcon: PomboIcons.withdraw,
                        buttonAction: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const TransactionCurrencyModal(
                                transactionType: 'withdraw',
                              );
                            },
                          );
                        },
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
