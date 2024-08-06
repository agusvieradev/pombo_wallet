import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboDrawerItem extends ConsumerWidget {
  const PomboDrawerItem({
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
      leading: Icon(
        icon,
        color: isActive ? PomboColors.pomboBlue : PomboColors.pomboPrimaryText,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Comfortaa',
          color:
              isActive ? PomboColors.pomboBlue : PomboColors.pomboPrimaryText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isActive
          ? Container(
              height: 50,
              width: 3.5,
              color: PomboColors.pomboBlue,
            )
          : null,
      onTap: action,
    );
  }
}
