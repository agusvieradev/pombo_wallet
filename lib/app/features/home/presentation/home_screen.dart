import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance_container.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transactions_container.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool secondVariable = true;

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BalanceContainer(),
            if (!secondVariable) PomboWhiteSpaces.hSpaceL,
            if (!secondVariable) const TransactionContainer(),
          ],
        ),
      ),
    );
  }
}
