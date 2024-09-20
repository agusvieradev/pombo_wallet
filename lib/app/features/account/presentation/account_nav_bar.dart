import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_nav_item.dart';
import 'package:pombo_wallet/app/features/account/application/account_nav_service.dart';

class AccountNavBar extends ConsumerWidget {
  const AccountNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountNavService accountNavService = ref.read(
      accountNavServiceProvider.notifier,
    );
    final int accountPagesIndex = ref.watch(componentIndexProvider);

    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AccountNavItem(
                navItemLabel: 'Datos personales',
                navItemisSelected: accountPagesIndex == 0,
                navItemAction: () {
                  accountNavService.changePageIndex(0);
                },
              ),
              PomboWhiteSpaces.wSpaceL,
              AccountNavItem(
                navItemLabel: 'Límites',
                navItemisSelected: accountPagesIndex == 1,
                navItemAction: () {
                  accountNavService.changePageIndex(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
