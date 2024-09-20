import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_information_container.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_limits.dart';

class AccountNavService extends StateNotifier<List<Widget>> {
  AccountNavService({required this.ref})
      : super([
          const AccountInformationContainer(),
          const AccountLimitsContainer(),
        ]);

  Ref ref;

  void changePageIndex(int i) {
    ref.read(componentIndexProvider.notifier).state = i;
  }
}

final StateNotifierProvider<AccountNavService, List<Widget>>
    accountNavServiceProvider =
    StateNotifierProvider<AccountNavService, List<Widget>>(
  (StateNotifierProviderRef<AccountNavService, List<Widget>> ref) {
    return AccountNavService(ref: ref);
  },
);

final StateProvider<int> componentIndexProvider = StateProvider<int>(
  (StateProviderRef<int> ref) => 0,
);
