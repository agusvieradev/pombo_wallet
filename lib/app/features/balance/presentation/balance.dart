import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class Balance extends ConsumerWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            PomboText().pomboXLText(text: '\$ 0,00'),
            PomboWhiteSpaces.wSpaceS,
            IconButton(
              onPressed: () {},
              icon: const Icon(
                PomboIcons.show,
                color: PomboColors.pomboBlue,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            PomboIcons.refresh,
            color: PomboColors.pomboBlue,
          ),
        )
      ],
    );
  }
}
