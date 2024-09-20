import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  const Account({
    required this.userid,
    required this.accountId,
    required this.balance,
    required this.accountData,
    required this.currency,
    required this.cvu,
    this.transaction = const [],
  });
  final String userid;
  final String accountId;
  final String cvu;
  final String accountData;
  final double balance;
  final String currency;
  final List<Transaction> transaction;
}
