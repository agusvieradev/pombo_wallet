import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_nav_bar.dart';
import 'package:pombo_wallet/app/features/account/application/account_nav_service.dart';

class AccountNavContainer extends ConsumerWidget {
  const AccountNavContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> accountNavState = ref.watch(
      accountNavServiceProvider,
    );
    final int accountPagesIndex = ref.watch(componentIndexProvider);

    return Container(
      alignment: Alignment.center,
      height: 900,
      child: Column(
        children: [
          const AccountNavBar(),
          PomboWhiteSpaces.hSpaceL,
          IndexedStack(
            index: accountPagesIndex,
            children: accountNavState,
          ),
        ],
      ),
    );
  }
}
