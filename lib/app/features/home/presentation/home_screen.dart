// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance_container.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transactions_container.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceContainer(),
            PomboWhiteSpaces.wSpaceL,
            TransactionContainer(),
          ],
        ),
      ),
    );
  }
}
