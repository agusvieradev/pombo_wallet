import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_primary_button.dart';

class BalanceContainer extends ConsumerWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = [];
    bool secondVariable = true;
    return PomboContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PomboText().pomboSmText(
                text: 'Hola, John Doe!',
                isPrimary: false,
                isBold: true,
                color: PomboColors.pomboBlue,
              ),
              PomboWhiteSpaces.hSpaceL,
              PomboText().pomboMdText(
                text: 'Tu cuenta',
                isBold: true,
              ),
              PomboWhiteSpaces.hSpaceM,
              const Balance(),
            ],
          ),
          PomboWhiteSpaces.hSpaceL,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PomboPrimaryButton(
                buttonText: 'Ingresar',
                buttonIcon: PomboIcons.deposit,
                buttonAction: () {},
              ),
              PomboWhiteSpaces.wSpaceL,
              PomboPrimaryButton(
                buttonText: 'Retirar',
                buttonIcon: PomboIcons.withdraw,
                buttonAction: () {},
              ),
            ],
          ),
          if (secondVariable) PomboWhiteSpaces.hSpaceM,
          if (secondVariable) const Divider(),
          if (secondVariable) PomboWhiteSpaces.hSpaceM,
          if (secondVariable)
            Column(
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
          if (!secondVariable) SizedBox()
        ],
      ),
    );
  }
}
