import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class PomboSidebarItem extends ConsumerWidget {
  const PomboSidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.action,
  });

  final String title;
  final IconData icon;
  final bool isActive;
  final void Function()? action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      title: Row(
        children: [
          Icon(
            icon,
            color:
                isActive ? PomboColors.pomboActive : PomboColors.pomboBlue,
            size: 24,
          ),
          PomboWhiteSpaces.wSpaceS,
          PomboText().pomboSmText(
            text: title,
            color:
                isActive ? PomboColors.pomboActive : PomboColors.pomboBlue, 
                isPrimary: false,
          ),
        ],
      ),
      trailing: isActive
          ? Container(
              height: 50,
              width: 3.5,
              color: PomboColors.pomboActive,
            )
          : null,
      onTap: action,
    );
  }
}
