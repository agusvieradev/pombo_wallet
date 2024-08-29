import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboInformation extends ConsumerWidget {
  const PomboInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            bottomLeft: Radius.circular(26),
          ),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'pombo_logo_og.svg',
          width: 700,
          height: 700,
          colorFilter: const ColorFilter.mode(
            PomboColors.pomboWhite,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
