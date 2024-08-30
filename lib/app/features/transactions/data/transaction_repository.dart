import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class TransactionRepository {
  TransactionRepository({
    required this.firestore,
  });
  final FirebaseFirestore firestore;

  Future<void> createTransaction(
    String userId,
    String accountId,
    String transactionId,
    double amount,
    String description,
    String currency,
    String method,
    String type,
  ) async {
    final CollectionReference<Map<String, dynamic>> transactionsCollection =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('accounts')
            .doc(accountId)
            .collection('transactions');

    await transactionsCollection.doc(transactionId).set({
      'amount': amount,
      'description': description,
      'type': type,
      'payment_method': method,
      'currency': currency,
      'date': FieldValue.serverTimestamp(),
    });
  }
}

final Provider<TransactionRepository> transactionRepositoryProvider =
    Provider<TransactionRepository>(
  (ProviderRef<TransactionRepository> ref) {
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    return TransactionRepository(firestore: firestore);
  },
);
