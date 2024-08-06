import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_sidebar.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboScreenLayout extends ConsumerWidget {
  const PomboScreenLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: PomboColors.pomboBackground,
      body: Row(
        children: [
          const PomboSideBar(),
          Expanded(child: child),
        ],
      ),
    );
  }
}
