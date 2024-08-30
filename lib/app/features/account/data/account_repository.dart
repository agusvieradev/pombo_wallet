import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class AccountRepository {
  AccountRepository({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Future<void> createAccount(
    String userId,
    String accountId,
    double balance,
    String currency,
  ) async {
    final CollectionReference<Map<String, dynamic>> accountsCollection =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('accounts');

    await accountsCollection.doc(accountId).set(
      {
        'balance': balance,
        'cvu': '000000000000',
        'account_data': '102030405-123123',
        'currency': currency,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
  }
}

final Provider<AccountRepository> accountRepositoryProvider =
    Provider<AccountRepository>(
  (ProviderRef<AccountRepository> ref) {
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    return AccountRepository(firestore: firestore);
  },
);
