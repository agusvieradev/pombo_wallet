import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';

class PomboWallet extends ConsumerWidget {
  const PomboWallet({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RouterConfig<Object>? routes = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: routes,
      title: 'Pombo wallet',
    );
  }
}
