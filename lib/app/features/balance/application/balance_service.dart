import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceService extends StateNotifier<Map<String, dynamic>> {
  BalanceService() : super({});
  setBalancesState(Map<String, dynamic> account) {
    state = account;
  }

}

final StateNotifierProvider balanceService =
    StateNotifierProvider<BalanceService, Map<String, dynamic>>((ref) {
  return BalanceService();
});
