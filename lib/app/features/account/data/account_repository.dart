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
    String type,
    double balance,
    String currency,
  ) async {
    final accountsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('accounts');

    await accountsCollection.doc(accountId).set(
      {
        'type': type,
        'balance': balance,
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
