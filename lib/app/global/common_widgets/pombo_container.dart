import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboContainer extends ConsumerWidget {
  const PomboContainer({
    super.key,
    required this.child,
    this.boxWidth = 750,
  });
  final Widget child;
  final double boxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
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
          padding: const EdgeInsets.all(30),
          width: boxWidth,
          child: child,
        ),
      ),
    );
  }
}
