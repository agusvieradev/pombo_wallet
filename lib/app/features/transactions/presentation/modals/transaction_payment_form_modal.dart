import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/build_payment_form.dart';

class TransactionPaymentForm extends ConsumerWidget {
  const TransactionPaymentForm({
    super.key,
    required this.transactionMethod,
    required this.transactionCurrency,
  });
  final String transactionMethod;
  final String transactionCurrency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboModal(
      stage: 3,
      body: Container(
        constraints: const BoxConstraints(minHeight: 600),
        alignment: Alignment.topCenter,
        width: double.maxFinite,
        child: builPaymentForm(
          transactionCurrency,
          transactionMethod,
          ref,
          context,
        ),
      ),
    );
  }
}
