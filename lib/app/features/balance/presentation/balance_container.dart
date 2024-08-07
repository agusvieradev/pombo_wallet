import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/features/balance/presentation/balance.dart';
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
              PomboText().pomboSmText(
                text: 'Hola, John Doe!',
                color: PomboColors.pomboBlue,
              ),
              PomboWhiteSpaces.hSpaceM,
              const Balance(),
            ],
          ),
          PomboWhiteSpaces.hSpaceS,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PomboPrimaryButton(
                buttonAction: () {},
                buttonText: 'Ingresar',
              ),
              PomboPrimaryButton(
                buttonAction: () {},
                buttonText: 'Retirar',
              ),
            ],
          )
        ],
      ),
    );
  }
}
