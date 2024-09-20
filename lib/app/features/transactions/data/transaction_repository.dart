import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/account/data/account_repository.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';

class TransactionRepository {
  TransactionRepository({
    required this.firestore,
    required this.accountRepository,
  });

  final FirebaseFirestore firestore;
  final AccountRepository accountRepository;
  
  Future<void> createTransaction({
    required String userId,
    required String accountId,
    required double amount,
    required String description,
    required String currency,
    required String method,
    required String type,
    required Map<String, dynamic> accountToData,
  }) async {
    final CollectionReference<Map<String, dynamic>> transactionsCollection =
        FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('accounts')
            .doc(accountId)
            .collection('transactions');

    String transactionId = transactionsCollection.doc().id;

    await transactionsCollection.doc(transactionId).set({
      'amount': amount,
      'description': description,
      'type': type,
      'payment_method': method,
      'to': accountToData,
      'currency': currency,
      'status': 'pending',
      'date': FieldValue.serverTimestamp(),
    });

    // if (type == 'deposit') {
    //   accountRepository.plusBalance(userId, accountId, amount);
    // }
    // if (type == 'withdraw') {
    //   accountRepository.restBalance(userId, accountId, amount);
    // }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTransactionsStream(
    String userId,
  ) {
    return FirebaseFirestore.instance
        .collectionGroup('transactions')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }
}

final Provider<TransactionRepository> transactionRepositoryProvider =
    Provider<TransactionRepository>(
  (ProviderRef<TransactionRepository> ref) {
    final FirebaseFirestore firestore = ref.watch(firestoreProvider);
    final AccountRepository accountRepository = ref.watch(
      accountRepositoryProvider,
    );
    return TransactionRepository(
      firestore: firestore,
      accountRepository: accountRepository,
    );
  },
);
