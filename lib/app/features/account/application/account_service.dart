import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService extends StateNotifier {
  AccountService() : super('');
}

final StateNotifierProvider<AccountService, dynamic> accountServiceProvider =
    StateNotifierProvider<AccountService, dynamic>(
  (StateNotifierProviderRef<AccountService, dynamic> ref) {
    return AccountService();
  },
);
