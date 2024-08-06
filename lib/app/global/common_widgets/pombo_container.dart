import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboContainer extends ConsumerWidget {
  const PomboContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          elevation: 4.0,
          child: Container(
            decoration: const BoxDecoration(
              color: PomboColors.pomboWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
            width: 700,
            height: 650,
            child: child,
          ),
        ),
      ),
    );
  }
}
