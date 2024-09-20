import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/domain/account.dart';

class AccountService extends StateNotifier<List<Account>> {
  AccountService() : super([]);

  List<Account> accountList = [];

  Stream<List<Map<String, dynamic>>> getAccountsStream(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('accounts')
        .snapshots()
        .map(
      (snapshot) {
        print(snapshot.docs);
        final List<Map<String, dynamic>> accounts = snapshot.docs.map(
          (doc) {
            print(doc.data());

            final Map<String, dynamic> data = doc.data();
            final Account account = Account(
              userid: userId,
              accountId: doc.id,
              balance: data['balance'],
              accountData: data['account_data'],
              currency: data['currency'],
              cvu: data['cvu'],
            );
            accountList.add(account);
            return {
              'accountId': doc.id,
              ...data,
            };
          },
        ).toList();
        state = accountList;
        return accounts;
      },
    );
  }
}

final StateNotifierProvider<AccountService, List<Account>>
    accountServiceProvider =
    StateNotifierProvider<AccountService, List<Account>>(
  (StateNotifierProviderRef<AccountService, List<Account>> ref) {
    return AccountService();
  },
);
