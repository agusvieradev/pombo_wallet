// ignore_for_file: dead_code, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_modal.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_primary_button.dart';

class BalanceContainer extends ConsumerWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PomboText().pomboMdText(
                text: 'Hola,  ',
                isPrimary: false,
                isBold: true,
                color: PomboColors.pomboBlue,
              ),
              PomboWhiteSpaces.hSpaceL,
              PomboText().pomboLgText(
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
                buttonAction: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PomboModal(
                        body: Container(),
                      );
                    },
                  );
                },
              ),
              PomboWhiteSpaces.wSpaceL,
              PomboPrimaryButton(
                buttonText: 'Retirar',
                buttonIcon: PomboIcons.withdraw,
                buttonAction: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PomboModal(
                        body: Container(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          PomboWhiteSpaces.hSpaceM,
        ],
      ),
    );
  }
}
