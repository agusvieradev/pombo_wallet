// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance_container.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/transactions_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await ref
      //         .read(transactionServiceProvider.notifier)
      //         .createTestDeposit();
      //   },
      // ),
      body: Container(
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
      ),
    );
  }
}
