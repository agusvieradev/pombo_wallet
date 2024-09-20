import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transaction_card.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/transaction_payment_form_modal.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/transaction_deposit_data_modal.dart';

  Column buildMethodsList(
    String transactionCurrency,
    String transactionType,
    BuildContext context,
  ) {
    switch (transactionCurrency) {
      case 'dolar':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TransactionCard(
              cardText: 'Transferencia',
              cardImagePath: 'bank.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'bank',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
            PomboWhiteSpaces.hSpaceL,
            TransactionCard(
              cardText: 'Paypal',
              cardImagePath: 'paypal.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'paypal',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'paypal',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'paypal',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
            PomboWhiteSpaces.hSpaceL,
            TransactionCard(
              cardText: 'Payoneer',
              cardImagePath: 'payoneer-logo.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'payoneer',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'payoneer',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'payoneer',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
            PomboWhiteSpaces.hSpaceL,
            TransactionCard(
              cardText: 'Wise',
              cardImagePath: 'Wise.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'wise',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'wise',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'dolar',
                        transactionMethod: 'wise',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ],
        );
      case 'euro':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransactionCard(
              cardText: 'Transferencia',
              cardImagePath: 'bank.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'euro',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'euro',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'euro',
                        transactionMethod: 'bank',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ],
        );
      case 'peso':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransactionCard(
              cardText: 'Transferencia',
              cardImagePath: 'bank.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'peso',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'peso',
                        transactionMethod: 'bank',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'peso',
                        transactionMethod: 'bank',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ],
        );
      case 'real':
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransactionCard(
              cardText: 'Pix',
              cardImagePath: 'pix.png',
              cardAction: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: PomboColors.pomboTrans,
                  builder: (BuildContext context) {
                    if (transactionType == 'deposit') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'real',
                        transactionMethod: 'pix',
                      );
                    } else if (transactionType == 'withdraw') {
                      return const TransactionDepositDataModal(
                        transactionCurrency: 'real',
                        transactionMethod: 'pix',
                      );
                    } else if (transactionType == 'payment') {
                      return const TransactionPaymentForm(
                        transactionCurrency: 'real',
                        transactionMethod: 'pix',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              },
            ),
          ],
        );
      default:
        return const Column();
    }
  }