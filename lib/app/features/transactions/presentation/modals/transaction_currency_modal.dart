import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/transaction_deposit_modal.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transaction_card.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/transaction_build_modal.dart';

class TransactionCurrencyModal extends ConsumerWidget {
  const TransactionCurrencyModal({super.key, required this.transactionType});
  final String transactionType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboModal(
      body: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        alignment: Alignment.center,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: TransactionBuildModal()
                  .buildTransactionTypeModal(transactionType),
            ),
            PomboWhiteSpaces.hSpaceL,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PomboWhiteSpaces.hSpaceL,
                TransactionCard(
                  cardText: 'Dolares',
                  cardImagePath: 'estados_unidos.png',
                  cardAction: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: PomboColors.pomboTrans,
                      builder: (BuildContext context) {
                        return TransactionPlatformTypeModal(
                          transactionCurrency: 'dolar',
                          transactionType: transactionType,
                        );
                      },
                    );
                  },
                ),
                PomboWhiteSpaces.hSpaceL,
                TransactionCard(
                  cardText: 'Euros',
                  cardImagePath: 'euro.png',
                  cardAction: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: PomboColors.pomboTrans,
                      builder: (BuildContext context) {
                        return TransactionPlatformTypeModal(
                          transactionCurrency: 'euro',
                          transactionType: transactionType,
                        );
                      },
                    );
                  },
                ),
                PomboWhiteSpaces.hSpaceL,
                TransactionCard(
                  cardText: 'Pesos',
                  cardImagePath: 'argentina.png',
                  cardAction: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: PomboColors.pomboTrans,
                      builder: (BuildContext context) {
                        return TransactionPlatformTypeModal(
                          transactionCurrency: 'peso',
                          transactionType: transactionType,
                        );
                      },
                    );
                  },
                ),
                PomboWhiteSpaces.hSpaceL,
                TransactionCard(
                  cardText: 'Reales',
                  cardImagePath: 'brasil.png',
                  cardAction: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: PomboColors.pomboTrans,
                      builder: (BuildContext context) {
                        return TransactionPlatformTypeModal(
                          transactionCurrency: 'real',
                          transactionType: transactionType,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
