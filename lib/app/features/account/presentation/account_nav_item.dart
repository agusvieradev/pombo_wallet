import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class AccountNavItem extends ConsumerWidget {
  const AccountNavItem({
    super.key,
    required this.navItemLabel,
    required this.navItemAction,
    required this.navItemisSelected,
  });

  final void Function()? navItemAction;
  final bool navItemisSelected;
  final String navItemLabel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: navItemAction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: navItemisSelected
                  ? PomboColors.pomboBlue
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: PomboText().pomboLgText(
          text: navItemLabel,
          isBold: navItemisSelected,
          color:
              navItemisSelected ? PomboColors.pomboBlue : PomboColors.pomboBlue,
        ),
      ),
    );
  }
}
