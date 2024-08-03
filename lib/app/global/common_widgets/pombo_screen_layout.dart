import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_appbar.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_drawer.dart';

class PomboScreenLayout extends ConsumerWidget {
  const PomboScreenLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 249, 250),
      body: Row(
        children: [
          PomboSideBar(),
          Expanded(child: child)
        ],
      ),
    );
  }
}
