import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class TransactionContainer extends ConsumerWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = [];
    return PomboContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PomboText().pomboMdText(text: 'Tus movimientos', isBold: true),
          PomboWhiteSpaces.hSpaceM,
          transactions.isEmpty
              ? PomboText().pomboSmText(
                  text:
                      'Todavia no tenés ningun movimiento, apretá el botón de ingresar para generar el primero',
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
