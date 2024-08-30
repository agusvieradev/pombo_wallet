import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';

class TransactionWithdrawModal extends ConsumerWidget {
  const TransactionWithdrawModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboModal(
      body: Column(
        children: [
          PomboText().pomboLgText(text: 'Retira tu dinero como vos quieras'),
          PomboText().pomboMdText(
            text: 'Elegí la divisa con la que queres retirar',
          ),
          Container(
            alignment: Alignment.center,
            child: ListView(
              children: [
                Container(
                  child: PomboText().pomboMdText(
                    text: 'Dolar',
                  ),
                ),
                Container(
                  child: PomboText().pomboMdText(
                    text: 'Pesos',
                  ),
                ),
                Container(
                  child: PomboText().pomboMdText(
                    text: 'Reales',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
