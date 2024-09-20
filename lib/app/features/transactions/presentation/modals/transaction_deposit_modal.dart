import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/transactions/presentation/modals/build_method_list.dart';

class TransactionPlatformTypeModal extends ConsumerWidget {
  const TransactionPlatformTypeModal({
    super.key,
    required this.transactionCurrency,
    required this.transactionType,
  });
  final String transactionCurrency;
  final String transactionType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboModal(
      stage: 2,
      body: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        alignment: Alignment.topCenter,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                PomboWhiteSpaces.hSpaceL,
                transactionType == 'withdraw'
                    ? PomboText().pomboLgText(
                        text: 'Elegí con que plataforma vas a retirar dinero',
                      )
                    : PomboText().pomboLgText(
                        text: 'Elegí con que plataforma vas a recibir dinero',
                      ),
                PomboWhiteSpaces.hSpaceL,
              ],
            ),
            PomboWhiteSpaces.hSpaceL,
            PomboWhiteSpaces.hSpaceL,
            buildMethodsList(
              transactionCurrency,
              transactionType,
              context,
            ),
          ],
        ),
      ),
    );
  }
}
