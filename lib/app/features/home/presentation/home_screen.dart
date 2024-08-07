import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance_container.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transactions_container.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BalanceContainer(),
          TransactionContainer(),
        ],
      ),
    );
  }
}
